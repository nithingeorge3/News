//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

//class DashboardCoordinator: BaseCoordinator {
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

class NewsListCoordinator: Coordinator {
    private let newsListViewFactory: NewsListViewFactory
    private let newsListViewModelFactory: NewsListViewModelFactory
    
    init(newsListViewFactory: NewsListViewFactory,
         newsListViewModelFactory: NewsListViewModelFactory
    ) {
        self.newsListViewFactory = newsListViewFactory
        self.newsListViewModelFactory = newsListViewModelFactory
    }

    func start() -> some View {
        newsListViewFactory.makeNewsListView(listViewModelFactory: newsListViewModelFactory)
    }
}
