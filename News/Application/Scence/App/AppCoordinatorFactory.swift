//
//  AppCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol AppCoordinatorFactory {
    func makeAppCoordinator() -> AppCoordinator
}

extension AppEnvironment : AppCoordinatorFactory {
    func makeAppCoordinator() -> AppCoordinator {
        AppCoordinator()
    }
}
