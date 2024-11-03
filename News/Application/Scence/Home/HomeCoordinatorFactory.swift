//
//  HomeCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol HomeCoordinatorFactory {
    func makeHomeCoordinator() -> HomeCoordinator
}

class DefaultHomeCoordinatorFactory: HomeCoordinatorFactory {
    private let navigationCoordinator: NavigationCoordinator
    private let homeViewModelFactory: HomeViewModelFactory
    
    init(navigationCoordinator: NavigationCoordinator, homeViewModelFactory: HomeViewModelFactory) {
        self.navigationCoordinator = navigationCoordinator
        self.homeViewModelFactory = homeViewModelFactory
    }
    
    func makeHomeCoordinator() -> HomeCoordinator {
        return HomeCoordinator(navigationCoordinator: navigationCoordinator, viewModelFactory: homeViewModelFactory)
    }
}
