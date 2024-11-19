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
        let tabItem = TabItem(title: "Listings", icon: "house", badgeCount: nil, color: .black)
        return ListingCoordinator(listingViewFactory: listingViewFactory, tabItem: tabItem)
    }
}
