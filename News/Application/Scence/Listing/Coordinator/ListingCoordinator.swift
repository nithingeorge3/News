//
//  ListingCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Foundation
import SwiftUI

class ListingCoordinator: Coordinator {
    
    private var listingViewFactory: ListingViewFactoryType
    private var listingViewModelFactory: ListingViewModelFactoryType
    
    
    init(listingViewFactory: ListingViewFactoryType, listingViewModelFactory: ListingViewModelFactoryType) {
        self.listingViewFactory = listingViewFactory
        self.listingViewModelFactory = listingViewModelFactory
    }
    
    
    func start() -> some View {
        listingViewFactory.makeListingView(listingViewModelFactory: listingViewModelFactory)
    }
}
