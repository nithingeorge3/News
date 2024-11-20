//
//  LoginCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import Combine

protocol LoginCoordinatorFactoryType {
    func makeLoginCoordinator() -> LoginCoordinator
}

class LoginCoordinatorFactory : LoginCoordinatorFactoryType {
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewFactory: LoginViewFactory
    private var navigationSubject: PassthroughSubject<LoginRoute, Never>
    
    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewFactory: LoginViewFactory,
        navigationSubject: PassthroughSubject<LoginRoute, Never>
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewFactory = loginViewFactory
        self.navigationSubject = navigationSubject
    }

    func makeLoginCoordinator() -> LoginCoordinator {
        return LoginCoordinator(
            navigationCoordinator: navigationCoordinator,
            loginViewFactory: loginViewFactory,
            navigationSubject: navigationSubject
        )
    }
}

