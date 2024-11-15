//
//  MenuCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MenuCoordinatorFactoryType {
    func makeMenuCoordinator() -> MenuCoordinator
}

class MenuCoordinatorFactory: MenuCoordinatorFactoryType {
    
    private var menuViewFactory: MenuViewFactoryType
    private var menuViewModelFactory: MenuViewModelFactoryType
    
    init(menuViewFactory: MenuViewFactoryType, menuViewModelFactory: MenuViewModelFactoryType) {
        self.menuViewFactory = menuViewFactory
        self.menuViewModelFactory = menuViewModelFactory
    }
    
    func makeMenuCoordinator() -> MenuCoordinator {
        MenuCoordinator(menuViewFactory: menuViewFactory, menuViewModelFactory: menuViewModelFactory)
    }
}
