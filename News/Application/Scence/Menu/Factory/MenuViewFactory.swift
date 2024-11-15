//
//  MenuViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MenuViewFactoryType {
    func makeMenuView(menuViewModelFactory: MenuViewModelFactoryType) -> MenuView
}

class MenuViewFactory: MenuViewFactoryType {
    
    func makeMenuView(menuViewModelFactory: MenuViewModelFactoryType) -> MenuView {
        MenuView(viewModel: menuViewModelFactory.makeMenuViewModel())
    }
}
