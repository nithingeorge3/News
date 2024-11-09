//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

//class DashboardCoordinator: BaseCoordinator {
//    private let navigationCoordinator: NavigationCoordinator
//    private let viewModelFactory: HomeViewModelFactory
//    
//    init(navigationCoordinator: NavigationCoordinator, viewModelFactory: HomeViewModelFactory) {
//        self.navigationCoordinator = navigationCoordinator
//        self.viewModelFactory = viewModelFactory
//    }
//    
//    override func start() {
//        navigationCoordinator.goToHome()
//    }
//}

class DashboardCoordinator: Coordinator {
    private let dashboardViewFactory: DashboardViewFactory

    init(dashboardViewFactory: DashboardViewFactory) {
        self.dashboardViewFactory = dashboardViewFactory
    }

    func start() -> some View {
        dashboardViewFactory.makeDashboardView()
    }
}
