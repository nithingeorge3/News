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
    
    
    init(listingViewFactory: ListingViewFactoryType) {
        self.listingViewFactory = listingViewFactory
    }
    
    func makeListingCoordinator() -> ListingCoordinator {
        ListingCoordinator(listingViewFactory: listingViewFactory)
    }
}
