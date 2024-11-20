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
    var loginCoordinator: LoginCoordinator
    var appTabCoordinator: AppTabCoordinator
    
    var body: some View {
        Group {
            switch appCoordinator.appState {
            case .loggedOut:
                loginFlow
            case .loggedIn:
                appTabCoordinator.start()
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
            loginCoordinator.start()
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
