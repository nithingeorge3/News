//
//  MenuCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class MenuCoordinator: Coordinator {
    
    private var menuViewFactory: MenuViewFactoryType
    private var menuViewModelFactory: MenuViewModelFactoryType
    
    init(menuViewFactory: MenuViewFactoryType, menuViewModelFactory: MenuViewModelFactoryType) {
        self.menuViewFactory = menuViewFactory
        self.menuViewModelFactory = menuViewModelFactory
    }
    
    func start() -> some View {
        menuViewFactory.makeMenuView(menuViewModelFactory: menuViewModelFactory)
    }
}
