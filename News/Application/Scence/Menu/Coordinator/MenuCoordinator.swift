//
//  MenuCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class MenuCoordinator: Coordinator {
    
    private var menuViewFactory: MenuViewFactoryType
    
    init(menuViewFactory: MenuViewFactoryType) {
        self.menuViewFactory = menuViewFactory
    }
    
    func start() -> some View {
        menuViewFactory.makeMenuView()
    }
}
