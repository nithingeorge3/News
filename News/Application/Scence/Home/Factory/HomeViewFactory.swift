//
//  HomeViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//
import SwiftUI

//class HomeViewFactory {
//    private let viewModelFactory: HomeViewModelFactory
//    
//    init(viewModelFactory: HomeViewModelFactory) {
//        self.viewModelFactory = viewModelFactory
//    }
//    
//    func makeHomeView() -> some View {
//        let viewModel = viewModelFactory.makeHomeViewModel()
//        return HomeView(viewModel: viewModel)
//    }
//}


class HomeViewFactory {
    func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
