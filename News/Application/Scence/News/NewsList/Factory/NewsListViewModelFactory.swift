//
//  HomeViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//


protocol NewsListViewModelFactoryType {
    func makeNewsListViewModel() -> NewsListViewModel
}

class NewsListViewModelFactory: NewsListViewModelFactoryType {
    func makeNewsListViewModel() -> NewsListViewModel {
        return NewsListViewModel()
    }
}
