//
//  HomeViewModel.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Article])
}

protocol NewsListViewModelType {
    var articles: [Article] { get }
    var state: ResultState { get }
    func getArticles()
}

class NewsListViewModel: ObservableObject, NewsListViewModelType {
    
    private(set) var articles: [Article] = []
    private let articleService: ArticleServiceType
    
    @Published private(set) var state: ResultState = .loading
    
    var cancellables: Set<AnyCancellable> = []
    
    
    init(articleService: ArticleServiceType) {
        self.articleService = articleService
    }
    
    func getArticles() {
        articleService.getArticles(endPoint: .articles, type: ArticleResponse.self)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            }
        receiveValue: { [weak self] articleResponse in
            self?.articles.removeAll()
            self?.articles = articleResponse.articles.filter { $0.title != nil || $0.source != nil }
        }
        .store(in: &cancellables)
    }
}
