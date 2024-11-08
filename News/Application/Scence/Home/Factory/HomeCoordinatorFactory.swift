//
//  HomeCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol HomeCoordinatorFactoryType {
    func makeHomeCoordinator() -> HomeCoordinator
}

class HomeCoordinatorFactory: HomeCoordinatorFactoryType {
    private let homeViewFactory: HomeViewFactory

    init(homeViewFactory: HomeViewFactory) {
        self.homeViewFactory = homeViewFactory
    }

    func makeHomeCoordinator() -> HomeCoordinator {
        return HomeCoordinator(homeViewFactory: homeViewFactory)
    }
}
