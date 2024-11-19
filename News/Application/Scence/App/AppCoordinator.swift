//
//  AppCoordinator.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI
import Combine
import NetworkModule

class AppCoordinator: ObservableObject {
    @Published var appState: AppState = .loggedOut
    @Published var navigationPath: NavigationPath = NavigationPath()
    var cancellables = Set<AnyCancellable>()
    let navigationSubject = PassthroughSubject<LoginRoute, Never>()

    var navigationPathBinding: Binding<NavigationPath> {
        Binding(
            get: { self.navigationPath },
            set: { self.navigationPath = $0 }
        )
    }

    func start() -> some View {
        AppCoordinatorView(appCoordinator: self)
    }

    func handleLoginRoute(_ route: LoginRoute) {
        DispatchQueue.main.async {
            switch route {
            case .success:
                self.appState = .loggedIn
            default:
                self.navigationPath.append(route)
            }
        }
    }
}

//typealias AppCoordinatorType = Coordinator

//class AppCoordinator: AppCoordinatorType {
//    
//    func start() -> some View {
//        
//        let navigationCoordinator = NavigationCoordinator()
//        
//        // Factories
//        let loginViewModelFactory = LoginViewModelFactory()
//        let loginViewFactory = LoginViewFactory(loginViewModel: loginViewModelFactory)
//        let newsListViewFactory = NewsListViewFactory()
//        let newsListViewModelFactory = NewsListViewModelFactory()
//        let newsListCoordinatorFactory = NewsListCoordinatorFactory(newsListViewFactory: newsListViewFactory, newsListViewModelFactory: newsListViewModelFactory)
//
//        // Actually NewListCoordinator should create from LoginCoordinator
//        
//        let loginCoordinatorFactory = LoginCoordinatorFactory(
//            navigationCoordinator: navigationCoordinator,
//            loginViewFactory: loginViewFactory,
//            newsListCoordinatorFactory: newsListCoordinatorFactory
//        )
//
//        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
//        
//        return loginCoordinator.start()
//        
//    }
//
//}
