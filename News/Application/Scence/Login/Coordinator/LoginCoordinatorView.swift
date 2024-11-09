//
//  LoginCoordinatorView.swift
//  News
//
//  Created by Nitin George on 04/11/2024.
//

import SwiftUI

import SwiftUI

struct LoginCoordinatorView: View {
    @ObservedObject var coordinator: LoginCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeLoginView()
                .navigationDestination(for: LoginRoute.self) { route in
                    switch route {
                    case .dashboard:
                        coordinator.makeDashboardView()
                    }
                }
        }
    }
}

//Testing LoginCoordinatorView
//To ensure that LoginCoordinatorView works correctly, you can write SwiftUI previews or unit tests
#Preview {
    let navigationCoordinator = NavigationCoordinator()
    let loginViewModelFactory = LoginViewModelFactory()
    let loginViewFactory = LoginViewFactory()
    let dashboardViewFactory = DashboardViewFactory()
    let dashboardCoordinatorFactory = DashboardCoordinatorFactory(dashboardViewFactory: dashboardViewFactory)

    let loginCoordinator = LoginCoordinator(
        navigationCoordinator: navigationCoordinator,
        loginViewModelFactory: loginViewModelFactory,
        loginViewFactory: loginViewFactory,
        dashboardCoordinatorFactory: dashboardCoordinatorFactory
    )

    LoginCoordinatorView(coordinator: loginCoordinator)

}


//
//struct LoginCoordinatorView: View {
//    @State private var path: [LoginRoute] = []
//    private let loginViewModelFactory: LoginViewModelFactory
//    private let homeViewFactory: HomeViewFactory
//
//    init(loginViewModelFactory: LoginViewModelFactory, homeViewFactory: HomeViewFactory) {
//        self.loginViewModelFactory = loginViewModelFactory
//        self.homeViewFactory = homeViewFactory
//    }
//
//    var body: some View {
//        NavigationStack(path: $path) {
//            makeLoginView()
//                .navigationDestination(for: LoginRoute.self) { route in
//                    switch route {
//                    case .home:
//                        makeHomeView()
//                    }
//                }
//        }
//    }
//
//    private func makeLoginView() -> some View {
//        let viewModel = loginViewModelFactory.makeLoginViewModel()
//        viewModel.onLoginSuccess = {
//            path.append(.home)
//        }
//        return LoginView(viewModel: viewModel)
//    }
//
//    private func makeHomeView() -> some View {
//        homeViewFactory.makeHomeView()
//    }
//}
