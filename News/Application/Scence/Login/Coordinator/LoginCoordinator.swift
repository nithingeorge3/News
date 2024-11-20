//
//  LoginCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

enum LoginRoute: Hashable {
    case tabView
    case success
    case signUp
    case forgot
    case logOut
}

protocol Navigator {
    func navigate(to route: LoginRoute)
}

class LoginCoordinator: Coordinator {
    
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewFactory: LoginViewFactory
    
    private var cancellables: Set<AnyCancellable> = []
    private let navigationSubject: PassthroughSubject<LoginRoute, Never>
    
    init(
    navigationCoordinator: NavigationCoordinator,
    loginViewFactory: LoginViewFactory,
    navigationSubject: PassthroughSubject<LoginRoute, Never>) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewFactory = loginViewFactory
        self.navigationSubject = navigationSubject
    }
    
    func start() -> some View {

        navigationSubject
            .sink { _ in
                print("LoginCoordinator: Received navigation event")
            }
            .store(in: &cancellables) // Retain subscription

        let viewModel = LoginViewModel(onNavigationSubject: navigationSubject)

        return LoginView(viewModel: viewModel)
            .eraseToAnyView()
    }
}
