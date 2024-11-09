//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

//class HomeCoordinator: BaseCoordinator {
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

class HomeCoordinator: Coordinator {
    private let homeViewFactory: HomeViewFactory

    init(homeViewFactory: HomeViewFactory) {
        self.homeViewFactory = homeViewFactory
    }

    func start() -> some View {
        homeViewFactory.makeHomeView()
    }
}
