//
//  MenuViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MenuViewFactoryType {
    func makeMenuView() -> MenuView
}

class MenuViewFactory: MenuViewFactoryType {
    
    private var menuViewModelFactory: MenuViewModelFactoryType
    
    init(menuViewModelFactory: MenuViewModelFactoryType) {
        self.menuViewModelFactory = menuViewModelFactory
    }
    
    func makeMenuView() -> MenuView {
        MenuView(viewModel: menuViewModelFactory.makeMenuViewModel())
    }
}
