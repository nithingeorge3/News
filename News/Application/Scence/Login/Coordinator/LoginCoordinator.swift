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
    private let loginViewFactory: LoginViewFactory
    private let newsListCoordinatorFactory: NewsListCoordinatorFactory
    private var navigationSubject = PassthroughSubject<LoginRoute, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    init(
        navigationCoordinator: NavigationCoordinator,
        loginViewFactory: LoginViewFactory,
        newsListCoordinatorFactory: NewsListCoordinatorFactory
    ) {
        self.navigationCoordinator = navigationCoordinator
        self.loginViewFactory = loginViewFactory
        self.newsListCoordinatorFactory = newsListCoordinatorFactory
        
        // Listen to navigation events from the subject
        navigationSubject
            .sink { [weak self] route in
                self?.navigate(to: route)
            }
            .store(in: &cancellables)
    }

    func start() -> some View {
        LoginCoordinatorView(coordinator: self)
    }

    func makeLoginView() -> some View {
        loginViewFactory.makeLoginView(navigationSubject: navigationSubject)
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

