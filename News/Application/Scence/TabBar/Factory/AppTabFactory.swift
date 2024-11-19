//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//


protocol AppTabFactoryType {
    func makeAppTabCoordinator() -> AppTabCoordinator
}

class AppTabFactory: AppTabFactoryType {
    
    func makeAppTabCoordinator() -> AppTabCoordinator {
        AppTabCoordinator()
    }
}
