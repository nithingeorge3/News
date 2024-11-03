//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

class HomeCoordinator: BaseCoordinator {
    private let navigationCoordinator: NavigationCoordinator
    private let viewModelFactory: HomeViewModelFactory
    
    init(navigationCoordinator: NavigationCoordinator, viewModelFactory: HomeViewModelFactory) {
        self.navigationCoordinator = navigationCoordinator
        self.viewModelFactory = viewModelFactory
    }
    
    override func start() {
        navigationCoordinator.goToHome()
    }
}
