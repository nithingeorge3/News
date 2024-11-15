//
//  ListingCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol ListingCoordinatorFactoryType {
    func makeListingCoordinator() -> ListingCoordinator
}


class ListingCoordinatorFactory: ListingCoordinatorFactoryType {
    
    private var listingViewFactory: ListingViewFactoryType
    private var listingViewModelFactory: ListingViewModelFactoryType
    
    
    init(listingViewFactory: ListingViewFactoryType, listingViewModelFactory: ListingViewModelFactoryType) {
        self.listingViewFactory = listingViewFactory
        self.listingViewModelFactory = listingViewModelFactory
    }
    
    func makeListingCoordinator() -> ListingCoordinator {
        ListingCoordinator(listingViewFactory: listingViewFactory, listingViewModelFactory: listingViewModelFactory)
    }
}
