//
//  HomeCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol DashboardCoordinatorFactoryType {
    func makeDashboardCoordinator() -> DashboardCoordinator
}

class DashboardCoordinatorFactory: DashboardCoordinatorFactoryType {
    private let dashboardViewFactory: DashboardViewFactory

    init(dashboardViewFactory: DashboardViewFactory) {
        self.dashboardViewFactory = dashboardViewFactory
    }

    func makeDashboardCoordinator() -> DashboardCoordinator {
        return DashboardCoordinator(dashboardViewFactory: dashboardViewFactory)
    }
}
