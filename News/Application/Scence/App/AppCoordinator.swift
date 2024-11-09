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
        let dashboardViewFactory = DashboardViewFactory()
        let dashboardCoordinatorFactory = DashboardCoordinatorFactory(dashboardViewFactory: dashboardViewFactory)

        let loginCoordinatorFactory = LoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            dashboardCoordinatorFactory: dashboardCoordinatorFactory
        )

        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
        
        return loginCoordinator.start()
        
    }

}
