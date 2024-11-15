//
//  ListingViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

protocol ListingViewFactoryType {
    func makeListingView(listingViewModelFactory: ListingViewModelFactoryType) -> ListingView
}

class ListingViewFactory: ListingViewFactoryType {
    func makeListingView(listingViewModelFactory: ListingViewModelFactoryType) -> ListingView {
        ListingView(viewModel: listingViewModelFactory.makeListingViewModel())
    }
}
