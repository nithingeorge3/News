//
//  HomeViewModel.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
//        NewsAPI.fetchNews { news in
            self.articles = []
//        }
    }
}
