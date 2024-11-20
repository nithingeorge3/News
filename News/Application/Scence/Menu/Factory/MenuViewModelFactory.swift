//
//  MenuViewModelFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Combine

protocol MenuViewModelFactoryType {
    func makeMenuViewModel() -> MenuViewModel
}

class MenuViewModelFactory: MenuViewModelFactoryType {
    
    private var navigationSubject = PassthroughSubject<LoginRoute, Never>()
    
    init(navigationSubject: PassthroughSubject<LoginRoute, Never>) {
        self.navigationSubject = navigationSubject
    }
    
    func makeMenuViewModel() -> MenuViewModel {
        return MenuViewModel(onNavigationSubject: navigationSubject)
    }
}
