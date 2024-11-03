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

@main
struct NewsApp: App {
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    
    private let loginViewModelFactory: LoginViewModelFactory
    private let homeViewModelFactory: HomeViewModelFactory
    private let loginCoordinatorFactory: LoginCoordinatorFactory
    private let homeCoordinatorFactory: HomeCoordinatorFactory
    
    init() {
        let navigationCoordinator = NavigationCoordinator()
        self._navigationCoordinator = StateObject(wrappedValue: navigationCoordinator)
        
        self.loginViewModelFactory = DefaultLoginViewModelFactory(navigationCoordinator: navigationCoordinator)
        self.homeViewModelFactory = DefaultHomeViewModelFactory()
        
        self.loginCoordinatorFactory = DefaultLoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory
        )
        self.homeCoordinatorFactory = DefaultHomeCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            homeViewModelFactory: homeViewModelFactory
        )
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                EmptyView()
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .login:
                            let loginViewFactory = LoginViewFactory(viewModelFactory: loginViewModelFactory)
                            loginViewFactory.makeLoginView()
                        case .home:
                            let homeViewFactory = HomeViewFactory(viewModelFactory: homeViewModelFactory)
                            homeViewFactory.makeHomeView()
                        }
                    }
                    .onAppear {
                        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
                        loginCoordinator.start()
                    }
            }
        }
    }
}
