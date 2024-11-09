//
//  HomeView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct NewsListView : View {
    
    @ObservedObject var viewModel: NewsListViewModel

    var body: some View {
        ArticleView(article: Article.dummyData)
            .frame(maxWidth: .infinity)
            .padding()
        Spacer()
    }
}

#Preview {
    NewsListView(viewModel: NewsListViewModel())
}
