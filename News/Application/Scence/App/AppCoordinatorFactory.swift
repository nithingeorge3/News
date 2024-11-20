//
//  AppCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import Combine

protocol AppCoordinatorFactoryType {
    func makeAppCoordinator() -> AppCoordinator
}

protocol AppCoordinatorViewFactoryType {
    func makeLoginViewCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> LoginCoordinator
    func makeAppTabCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> AppTabCoordinator
}

extension AppEnvironment : AppCoordinatorFactoryType {
    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator()
    }
}

class AppCoordinatorFactory : AppCoordinatorViewFactoryType {
    
    let navigationCoordinator = NavigationCoordinator()
    
    func makeLoginViewCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> LoginCoordinator {
        
        // Factories
        let loginViewModelFactory = LoginViewModelFactory(navigationSubject: navigationSubject)
        let loginViewFactory = LoginViewFactory(viewModel: loginViewModelFactory.makeLoginViewModel())

        // Actually NewListCoordinator should create from LoginCoordinator
        
        let loginCoordinatorFactory = LoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewFactory: loginViewFactory,
            navigationSubject: navigationSubject
        )

        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
        
        return loginCoordinator
    }
    
    func makeAppTabCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> AppTabCoordinator {
        AppTabCoordinatorFactory().makeAppTabCoordinator(navigationSubject: navigationSubject)
    }
}
