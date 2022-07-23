//
//  ContentView.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    private(set) var services: Services
    private let url = ""
    init(services: Services) {
        self.services = services
    }
    
    func getData() {
        await services.networker.titleRequest(url: url) { [weak self] result -> [String] in
            switch result {
            case .success(let title):
                return await self?.services.networker.descriptionRequest(urls: [title]) { description -> AnyPublisher<[String], Error>}
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct ContentView<viewModel: ContentViewModel>: View {
    private(set) var viewModel: viewModel
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(services: .init()))
    }
}
