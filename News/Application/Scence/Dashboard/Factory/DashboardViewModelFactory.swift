//
//  HomeViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//


protocol DashboardViewModelFactoryType {
    func makeDashboardViewModel() -> DashboardViewModel
}

class DashboardViewModelFactory: DashboardViewModelFactoryType {
    func makeDashboardViewModel() -> DashboardViewModel {
        return DashboardViewModel()
    }
}
