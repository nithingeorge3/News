//
//  LoginCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol LoginCoordinatorFactory {
    func makeLoginCoordinator() -> LoginCoordinator
}

class DefaultLoginCoordinatorFactory: LoginCoordinatorFactory {
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewModelFactory: LoginViewModelFactory
    
    init(navigationCoordinator: NavigationCoordinator, loginViewModelFactory: LoginViewModelFactory) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewModelFactory = loginViewModelFactory
    }
    
    func makeLoginCoordinator() -> LoginCoordinator {
        return LoginCoordinator(navigationCoordinator: navigationCoordinator, viewModelFactory: loginViewModelFactory)
    }
}
