//
//  AppCoordinator.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI
import Combine
import NetworkModule

class AppCoordinator: ObservableObject {
    @Published var appState: AppState = .loggedOut
    @Published var navigationPath: NavigationPath = NavigationPath()
    var cancellables = Set<AnyCancellable>()
    let navigationSubject = PassthroughSubject<LoginRoute, Never>()
    
    var navigationPathBinding: Binding<NavigationPath> {
        Binding(
            get: { self.navigationPath },
            set: { self.navigationPath = $0 }
        )
    }

    func start() -> some View {
        return AppCoordinatorView(appCoordinator: self,
                                  appTabFactory: AppCoordinatorFactory(),
                                  navigationSubject: navigationSubject)
    }

    func handleLoginRoute(_ route: LoginRoute) {
        DispatchQueue.main.async {
            switch route {
            case .success:
                self.appState = .loggedIn
            case .logOut:
                self.appState = .loggedOut
            default:
                self.navigationPath.append(route)
            }
        }
    }
}
