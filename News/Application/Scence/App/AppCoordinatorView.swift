//
//  AppCoordinatorView.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//

import SwiftUI
import Combine
import NetworkModule

struct AppCoordinatorView: View {
    @ObservedObject var appCoordinator: AppCoordinator
    let appTabFactory: AppCoordinatorFactory
    let navigationSubject: PassthroughSubject<LoginRoute, Never>
    
    var body: some View {
        Group {
            switch appCoordinator.appState {
            case .loggedOut:
                loginFlow
            case .loggedIn:
                appTabFactory.makeAppTabCoordinator(navigationSubject: navigationSubject).start()
            }
        }
        .onAppear {
            appCoordinator.navigationSubject
                .sink { [weak appCoordinator] route in
                    appCoordinator?.handleLoginRoute(route)
                }
                .store(in: &appCoordinator.cancellables)
        }
    }

    private var loginFlow: some View {
        NavigationStack(path: appCoordinator.navigationPathBinding) {
            appTabFactory.makeLoginViewCoordinator(navigationSubject: navigationSubject).start()
                .navigationDestination(for: LoginRoute.self) { route in
                    switch route {
                    case .signUp:
                        SignUpView()
                    default:
                        fatalError("Unhandled route: \(route)")
                    }
                }
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
