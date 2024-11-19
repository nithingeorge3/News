//
//  HomeCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

protocol NewsListCoordinatorFactoryType {
    func makeNewsListCoordinator() -> NewsListCoordinator
}

class NewsListCoordinatorFactory: NewsListCoordinatorFactoryType {
    private let newsListViewFactory: NewsListViewFactoryType
    
    init(newsListViewFactory: NewsListViewFactoryType) {
        self.newsListViewFactory = newsListViewFactory
    }

    func makeNewsListCoordinator() -> NewsListCoordinator {
        let tabItem = TabItem(title: "Today", icon: "checkmark.square", badgeCount: nil, color: .black)
        return NewsListCoordinator(newsListViewFactory: newsListViewFactory, tabItem: tabItem)
    }
}
