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
    
    init(listingViewFactory: ListingViewFactoryType) {
        self.listingViewFactory = listingViewFactory
    }
    
    
    func start() -> some View {
        listingViewFactory.makeListingView()
    }
}
