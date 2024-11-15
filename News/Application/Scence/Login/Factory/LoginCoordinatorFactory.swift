//
//  LoginCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol LoginCoordinatorFactoryType {
    func makeLoginCoordinator() -> LoginCoordinator
}

class LoginCoordinatorFactory: LoginCoordinatorFactoryType {
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewFactory: LoginViewFactory
    private let loginViewModelFactory: LoginViewModelFactory
    private let newsListCoordinatorFactory: NewsListCoordinatorFactory

    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewFactory: LoginViewFactory,
        loginViewModelFactory: LoginViewModelFactory,
        newsListCoordinatorFactory: NewsListCoordinatorFactory
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewFactory = loginViewFactory
        self.loginViewModelFactory = loginViewModelFactory
        self.newsListCoordinatorFactory = newsListCoordinatorFactory
    }

    func makeLoginCoordinator() -> LoginCoordinator {
        return LoginCoordinator(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            newsListCoordinatorFactory: newsListCoordinatorFactory
        )
    }
}

