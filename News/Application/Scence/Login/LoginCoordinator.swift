//
//  LoginCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

enum LoginRoute: Hashable {
    case home
}


class LoginCoordinator: BaseCoordinator, ObservableObject {
    @Published var path: [LoginRoute] = []
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewModelFactory: LoginViewModelFactory
    private let loginViewFactory: LoginViewFactory
    private let homeCoordinatorFactory: HomeCoordinatorFactory

    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewModelFactory: LoginViewModelFactory,
        loginViewFactory: LoginViewFactory,
        homeCoordinatorFactory: HomeCoordinatorFactory
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewModelFactory = loginViewModelFactory
        self.loginViewFactory = loginViewFactory
        self.homeCoordinatorFactory = homeCoordinatorFactory
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
                self?.navigate(to: .home)
            }
            .store(in: &viewModel.cancellables)
        
        return loginViewFactory.makeLoginView(viewModel: viewModel as! LoginViewModel)
    }

    func makeHomeView() -> some View {
        let homeCoordinator = homeCoordinatorFactory.makeHomeCoordinator()
        return homeCoordinator.start()
    }
}
