//
//  NewsApp.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

//@main
//struct NewsApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


//@main
//struct MyApp: App {
//    private let loginCoordinator: LoginCoordinator
//
//    init() {
//        let loginViewModelFactory = DefaultLoginViewModelFactory()
//        let homeViewModelFactory = DefaultHomeViewModelFactory()
//        let homeViewFactory = HomeViewFactory(viewModelFactory: homeViewModelFactory)
//        self.loginCoordinator = LoginCoordinator(
//            loginViewModelFactory: loginViewModelFactory,
//            homeViewFactory: homeViewFactory
//        )
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            loginCoordinator.start() // future move to AppCoordinator
//        }
//    }
//}

@main
struct MyApp: App {
    @StateObject private var loginCoordinator: LoginCoordinator

    init() {
        let navigationCoordinator = NavigationCoordinator()

        // Factories
        let loginViewModelFactory = DefaultLoginViewModelFactory()
        let loginViewFactory = LoginViewFactory()
        let homeViewFactory = HomeViewFactory()
        let homeCoordinatorFactory = DefaultHomeCoordinatorFactory(homeViewFactory: homeViewFactory)

        let loginCoordinatorFactory = DefaultLoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            homeCoordinatorFactory: homeCoordinatorFactory
        )

        // Create LoginCoordinator
        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
        _loginCoordinator = StateObject(wrappedValue: loginCoordinator)
    }

    var body: some Scene {
        WindowGroup {
            loginCoordinator.start()
        }
    }
}
