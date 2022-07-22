//
//  bellierApp.swift
//  bellier
//
//  Created by Misha Causur on 22.07.2022.
//

import SwiftUI

@main
struct bellierApp: App {
    let services: Services = .init()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(services: .init()))
        }
    }
}
