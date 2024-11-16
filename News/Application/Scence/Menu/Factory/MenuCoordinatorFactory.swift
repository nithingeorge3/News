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
    
    init(menuViewFactory: MenuViewFactoryType) {
        self.menuViewFactory = menuViewFactory
    }
    
    func makeMenuCoordinator() -> MenuCoordinator {
        MenuCoordinator(menuViewFactory: menuViewFactory)
    }
}
