//
//  HomeView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct DashboardView : View {
    
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        ArticleView(article: Article.dummyData)
            .frame(maxWidth: .infinity)
            .padding()
        Spacer()
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
