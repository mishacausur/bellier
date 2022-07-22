//
//  ContentView.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    private(set) var services: Services
    init(services: Services) {
        self.services = services
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
