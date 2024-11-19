//
//  ListingCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Foundation
import SwiftUI

class ListingCoordinator: Coordinator, TabItemProvider {
    
    private var listingViewFactory: ListingViewFactoryType    
    private let _tabItem: TabItem
    
    var tabItem: TabItem {
        _tabItem
    }

    init(listingViewFactory: ListingViewFactoryType, tabItem: TabItem) {
        self.listingViewFactory = listingViewFactory
        _tabItem = tabItem
    }
    
    
    func start() -> some View {
        listingViewFactory.makeListingView()
    }
}
