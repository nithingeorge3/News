//
//  LoginCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

enum LoginRoute: Hashable {
    case newsList
}

protocol Navigator {
    func navigate(to route: LoginRoute)
}

class LoginCoordinator: Coordinator, ObservableObject {
   
    @Published var path: [LoginRoute] = []
   
    private let navigationCoordinator: NavigationCoordinator
    private let loginViewModelFactory: LoginViewModelFactory
    private let loginViewFactory: LoginViewFactory
    private let newsListCoordinatorFactory: NewsListCoordinatorFactory

    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewModelFactory: LoginViewModelFactory,
        loginViewFactory: LoginViewFactory,
        newsListCoordinatorFactory: NewsListCoordinatorFactory
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewModelFactory = loginViewModelFactory
        self.loginViewFactory = loginViewFactory
        self.newsListCoordinatorFactory = newsListCoordinatorFactory
    }

    func start() -> some View {
        LoginCoordinatorView(coordinator: self)
    }

    func makeLoginView() -> some View {
        loginViewFactory.makeLoginView { [weak self] route in
            self?.navigate(to: route)
        }
    }

    func makeNewsListView() -> some View {
        let newsListCoordinator = newsListCoordinatorFactory.makeNewsListCoordinator()
        return newsListCoordinator.start()
    }
}


extension LoginCoordinator: Navigator {
    func navigate(to route: LoginRoute) {
        path.append(route)
    }
}

