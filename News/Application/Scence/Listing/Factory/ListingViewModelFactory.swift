//
//  ListingViewModelFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol ListingViewModelFactoryType {
    func makeListingViewModel() -> ListingViewModel
}

class ListingViewModelFactory: ListingViewModelFactoryType {
    func makeListingViewModel() -> ListingViewModel {
        return ListingViewModel()
    }
}
