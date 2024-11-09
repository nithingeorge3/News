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
    private let newsListViewModelFactory: NewsListViewModelFactory
    
    init(newsListViewFactory: NewsListViewFactory,
         newsListViewModelFactory: NewsListViewModelFactory
    ) {
        self.newsListViewFactory = newsListViewFactory
        self.newsListViewModelFactory = newsListViewModelFactory
    }

    func makeNewsListCoordinator() -> NewsListCoordinator {
        return NewsListCoordinator(newsListViewFactory: newsListViewFactory, newsListViewModelFactory: newsListViewModelFactory)
    }
}
