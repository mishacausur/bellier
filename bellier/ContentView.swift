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
    private(set) var dect: [String] = .init()
    init(services: Services) {
        self.services = services
    }
    
    func getData() async {
        await services.networker.titleRequest(url: url) { [weak self] in
            switch $0 {
            case .success(let title):
                await self?.services.networker.descriptionRequest(urls: [title])
                    .sink(receiveCompletion: { _ in
                    },
                          receiveValue: { result in
                    self?.dect = result
                })
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
