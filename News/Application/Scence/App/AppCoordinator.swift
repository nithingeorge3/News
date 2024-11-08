//
//  AppCoordinator.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

typealias AppCoordinatorType = Coordinator

class AppCoordinator: AppCoordinatorType {
    
    func start() -> some View {
        
        let navigationCoordinator = NavigationCoordinator()
        
        // Factories
        let loginViewModelFactory = LoginViewModelFactory()
        let loginViewFactory = LoginViewFactory()
        let homeViewFactory = HomeViewFactory()
        let homeCoordinatorFactory = HomeCoordinatorFactory(homeViewFactory: homeViewFactory)

        let loginCoordinatorFactory = LoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            homeCoordinatorFactory: homeCoordinatorFactory
        )

        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
        
        return loginCoordinator.start()
        
    }

}
