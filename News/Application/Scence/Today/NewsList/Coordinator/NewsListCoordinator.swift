//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

class NewsListCoordinator: Coordinator, TabItemProvider {
    
    private let newsListViewFactory: NewsListViewFactoryType
    private let _tabItem: TabItem
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(newsListViewFactory: NewsListViewFactoryType,
         tabItem: TabItem) {
        self.newsListViewFactory = newsListViewFactory
        _tabItem = tabItem
    }

    func start() -> some View {
        newsListViewFactory.makeNewsListView()
    }
}
