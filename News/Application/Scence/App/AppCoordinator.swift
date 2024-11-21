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
        let loginCoordinator = AppCoordinatorFactory().makeLoginViewCoordinator(navigationSubject: navigationSubject)
        let appTabFactory = AppCoordinatorFactory()
                                                                               
        return AppCoordinatorView(
            appCoordinator: self,
            loginCoordinator: loginCoordinator,
            appTabCoordinator: appTabFactory.makeAppTabCoordinator(navigationSubject: navigationSubject)) // i think we just nee dto load Tab creation after login Success
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
