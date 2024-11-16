//
//  MenuViewModelFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MenuViewModelFactoryType {
    func makeMenuViewModel() -> MenuViewModel
}

class MenuViewModelFactory: MenuViewModelFactoryType {
    func makeMenuViewModel() -> MenuViewModel {
        return MenuViewModel()
    }
}
