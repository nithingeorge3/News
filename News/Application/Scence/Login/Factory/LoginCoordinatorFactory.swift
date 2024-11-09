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
    private let loginViewModelFactory: LoginViewModelFactory
    private let loginViewFactory: LoginViewFactory
    private let dashboardCoordinatorFactory: DashboardCoordinatorFactory

    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewModelFactory: LoginViewModelFactory,
        loginViewFactory: LoginViewFactory,
        dashboardCoordinatorFactory: DashboardCoordinatorFactory
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewModelFactory = loginViewModelFactory
        self.loginViewFactory = loginViewFactory
        self.dashboardCoordinatorFactory = dashboardCoordinatorFactory
    }

    func makeLoginCoordinator() -> LoginCoordinator {
        return LoginCoordinator(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            dashboardCoordinatorFactory: dashboardCoordinatorFactory
        )
    }
}

