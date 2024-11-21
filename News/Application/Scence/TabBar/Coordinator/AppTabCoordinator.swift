//
//  AppTabCoordinator.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI

class AppTabCoordinator: Coordinator {
    
    let appTabViewFactory: AppTabViewFactory
    
    //private var tabs: [TabBarItem] = []
    
    init(appTabViewFactory: AppTabViewFactory) {
        self.appTabViewFactory = appTabViewFactory
    }
    
    func start() -> some View {
        appTabViewFactory.makeAppTabView()
    }
}
