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
    private let newsListViewModelFactory: NewsListViewModelFactory
    
    init(newsListViewFactory: NewsListViewFactoryType,
         newsListViewModelFactory: NewsListViewModelFactory
    ) {
        self.newsListViewFactory = newsListViewFactory
        self.newsListViewModelFactory = newsListViewModelFactory
    }

    func makeNewsListCoordinator() -> NewsListCoordinator {
        return NewsListCoordinator(newsListViewFactory: newsListViewFactory, newsListViewModelFactory: newsListViewModelFactory)
    }
}
