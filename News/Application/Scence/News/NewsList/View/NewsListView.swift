//
//  HomeView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import NetworkModule

struct NewsListView : View {
    
    @ObservedObject var viewModel: NewsListViewModel
    
    var body: some View {
        
        Group {
            switch viewModel.state {
            case.loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    viewModel.getArticles()
                }
            case .success(let content):
                List(content) { article in
                    ArticleView(article: article)
                        .padding([.leading, .bottom, .top], 10)
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            viewModel.getArticles()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("News")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    let articleService = ArticleService(parser: ArticleServiceParser())
    NewsListView(viewModel:
                    NewsListViewModel(articleService: articleService))
}
