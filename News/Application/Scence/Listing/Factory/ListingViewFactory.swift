//
//  ListingViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

protocol ListingViewFactoryType {
    func makeListingView() -> ListingView
}

class ListingViewFactory: ListingViewFactoryType {
    
    private var listingViewModelFactory: ListingViewModelFactoryType
    
    init(listingViewModelFactory: ListingViewModelFactoryType) {
        self.listingViewModelFactory = listingViewModelFactory
    }
    
    func makeListingView() -> ListingView {
        ListingView(viewModel: listingViewModelFactory.makeListingViewModel())
    }
}
