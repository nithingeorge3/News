//
//  HomeView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct HomeView : View {
    
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        Text("Home View")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}