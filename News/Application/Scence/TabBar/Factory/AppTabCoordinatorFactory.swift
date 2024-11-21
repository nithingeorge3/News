//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//

import Combine

protocol AppTabCoordinatorFactoryType {
    func makeAppTabCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> AppTabCoordinator
}

class AppTabCoordinatorFactory: AppTabCoordinatorFactoryType {
    
    func makeAppTabCoordinator(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> AppTabCoordinator {
                
        let newsListViewModelFactory = NewsListViewModelFactory()
        let newsListViewFactory = NewsListViewFactory(newsListViewModelFactory: newsListViewModelFactory)
        let newsListCoordinatorFactory = NewsListCoordinatorFactory(newsListViewFactory: newsListViewFactory)
        let newsListCoordinator = newsListCoordinatorFactory.makeNewsListCoordinator()
        
        let calendarViewModelFactory = CalendarViewModelFactory()
        let calendarViewFactory = CalendarViewFactory(calendarViewModelFactory: calendarViewModelFactory)
        let calendarCoordinatorFactory = CalendarCoordinatorFactory(calendarViewFactory: calendarViewFactory)
        let calendarCoordinator = calendarCoordinatorFactory.makeCalendarCoordinator()
        
        let listingViewModelFactory = ListingViewModelFactory()
        let listingViewFactory = ListingViewFactory(listingViewModelFactory: listingViewModelFactory)
        let listingCoordinatorFactory = ListingCoordinatorFactory(listingViewFactory: listingViewFactory)
        let listingCoordinator = listingCoordinatorFactory.makeListingCoordinator()
        
        let messagesViewFactory = MessagesViewFactory(messagesViewModel: MessagesViewModelFactory().makeMessagesViewModel())
        let messagesCoordinatorFactory = MessagesCoordinatorFactory(messagesViewFactory: messagesViewFactory)
        let messagesCoordinator = messagesCoordinatorFactory.makeMessagesCoordinator()
        
        let menuViewModelFactory = MenuViewModelFactory(navigationSubject: navigationSubject)
        let menuViewFactory = MenuViewFactory(menuViewModelFactory: menuViewModelFactory)
        let menuCoordinatorFactory = MenuCoordinatorFactory(menuViewFactory: menuViewFactory)
        let menuCoordinator = menuCoordinatorFactory.makeMenuCoordinator()
        
        let viewFactory = AppTabViewFactory(coordinators: [newsListCoordinator,
                                                           calendarCoordinator,
                                                           listingCoordinator,
                                                           messagesCoordinator,
                                                           menuCoordinator])
        
        return AppTabCoordinator(appTabViewFactory: viewFactory)
    }
}
