//
//  HomeViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import NetworkModule

protocol NewsListViewModelFactoryType {
    func makeNewsListViewModel() -> NewsListViewModel
}

class NewsListViewModelFactory: NewsListViewModelFactoryType {
    func makeNewsListViewModel() -> NewsListViewModel {
        
        let articleService = ArticleServiceFactory.articleService()
        
        return NewsListViewModel(articleService: articleService)
    }
}
