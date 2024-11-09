//
//  LoginCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

enum LoginRoute: Hashable {
    case dashboard
}

class LoginCoordinator: Coordinator, ObservableObject {
    @Published var path: [LoginRoute] = []
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

    func start() -> some View {
        LoginCoordinatorView(coordinator: self)
    }

    func navigate(to route: LoginRoute) {
        path.append(route)
    }

    func makeLoginView() -> some View {
        let viewModel = loginViewModelFactory.makeLoginViewModel()
        
        viewModel.loginSuccessSubject
            .sink { [weak self] in
                self?.navigate(to: .dashboard)
            }
            .store(in: &viewModel.cancellables)
        
        return loginViewFactory.makeLoginView(viewModel: viewModel as! LoginViewModel)
    }

    func makeDashboardView() -> some View {
        let dashboardCoordinator = dashboardCoordinatorFactory.makeDashboardCoordinator()
        return dashboardCoordinator.start()
    }
}
