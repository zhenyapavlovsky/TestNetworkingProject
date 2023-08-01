//
//  TestNetworkingProjectApp.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import SwiftUI

@main
struct TestNetworkingProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModelImpl(
                    userService: ServiceContainer.shared.userService
                )
            )
        }
    }
}
