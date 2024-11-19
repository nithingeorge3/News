//
//  AppCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol AppCoordinatorFactoryType {
    func makeAppCoordinator() -> AppCoordinator
}

extension AppEnvironment : AppCoordinatorFactoryType {
    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator()
    }
}

class AppCoordinatorFactory : AppCoordinatorFactoryType {
    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator()
    }
}
