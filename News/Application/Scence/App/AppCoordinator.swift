//
//  AppCoordinator.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

typealias AppCoordinatorType = Coordinator

class AppCoordinator: AppCoordinatorType {
    
    func start() -> some View {
        
        let navigationCoordinator = NavigationCoordinator()
        
        // Factories
        let loginViewModelFactory = LoginViewModelFactory()
        let loginViewFactory = LoginViewFactory()
        let newsListViewFactory = NewsListViewFactory()
        let newsListViewModelFactory = NewsListViewModelFactory()
        let newsListCoordinatorFactory = NewsListCoordinatorFactory(newsListViewFactory: newsListViewFactory, newsListViewModelFactory: newsListViewModelFactory)

        // Actually NewListCoordinator should create from LoginCoordinator
        
        let loginCoordinatorFactory = LoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            newsListCoordinatorFactory: newsListCoordinatorFactory
        )

        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()
        
        return loginCoordinator.start()
        
    }

}
