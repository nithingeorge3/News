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


class DashboardViewFactory {
    func makeDashboardView() -> some View {
        let viewModel = DashboardViewModel()
        return DashboardView(viewModel: viewModel)
    }
}
