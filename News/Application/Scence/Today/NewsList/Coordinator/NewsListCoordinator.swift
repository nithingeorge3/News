//
//  HomeCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

class NewsListCoordinator: Coordinator {
    private let newsListViewFactory: NewsListViewFactoryType
//    let tab: TabItem
    
    init(newsListViewFactory: NewsListViewFactoryType) {
        self.newsListViewFactory = newsListViewFactory
    }

    func start() -> some View {
        newsListViewFactory.makeNewsListView()
    }
}
