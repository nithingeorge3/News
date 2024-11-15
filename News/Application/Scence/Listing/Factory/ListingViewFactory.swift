//
//  ListingViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class ListingViewFactory {
    func makeListingView(listingViewModelFactory: ListingViewModelFactoryType) -> ListingView {
        ListingView(viewModel: listingViewModelFactory.makeListingViewModel())
    }
}
