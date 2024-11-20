//
//  HomeViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//
import SwiftUI

protocol NewsListViewFactoryType {
    func makeNewsListView() -> NewsListView
}

class NewsListViewFactory: NewsListViewFactoryType {
    
    let newsListViewModelFactory: NewsListViewModelFactory
    
    init(newsListViewModelFactory: NewsListViewModelFactory) {
        self.newsListViewModelFactory = newsListViewModelFactory
    }
    
    func makeNewsListView() -> NewsListView { //some View {
        
        let newsListViewModel = newsListViewModelFactory.makeNewsListViewModel()
        return NewsListView(viewModel: newsListViewModel)
    }
}
