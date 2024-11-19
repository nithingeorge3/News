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
        return NewsListCoordinator(newsListViewFactory: newsListViewFactory)
    }
}
