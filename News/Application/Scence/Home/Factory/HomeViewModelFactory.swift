//
//  HomeViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//


protocol HomeViewModelFactory {
    func makeHomeViewModel() -> HomeViewModel
}

class DefaultHomeViewModelFactory: HomeViewModelFactory {
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }
}
