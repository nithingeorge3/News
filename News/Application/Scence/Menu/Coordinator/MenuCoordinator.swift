//
//  MenuCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class MenuCoordinator: Coordinator, TabItemProvider {
    
    private var menuViewFactory: MenuViewFactoryType
    private let _tabItem: TabItem
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(menuViewFactory: MenuViewFactoryType, tabItem: TabItem) {
        self.menuViewFactory = menuViewFactory
        _tabItem = tabItem
    }
    
    func start() -> some View {
        menuViewFactory.makeMenuView()
    }
}
