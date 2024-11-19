//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//


protocol AppTabCoordinatorFactoryType {
    func makeAppTabCoordinator() -> AppTabCoordinator
}

class AppTabCoordinatorFactory: AppTabCoordinatorFactoryType {
    
    func makeAppTabCoordinator() -> AppTabCoordinator {
        AppTabCoordinator(appTabViewFactory: AppTabViewFactory())
    }
}
