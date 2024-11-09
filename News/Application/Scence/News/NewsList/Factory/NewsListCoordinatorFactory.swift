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
    private let newsListViewFactory: NewsListViewFactory

    init(newsListViewFactory: NewsListViewFactory) {
        self.newsListViewFactory = newsListViewFactory
    }

    func makeNewsListCoordinator() -> NewsListCoordinator {
        return NewsListCoordinator(newsListViewFactory: newsListViewFactory)
    }
}
