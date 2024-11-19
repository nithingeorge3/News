//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//


protocol AppTabCoordinatorFactoryType {
    func makeAppTabCoordinator() -> AppTabCoordinator
}

class AppTabCoordinatorFactory: AppTabCoordinatorFactoryType {
    
    func makeAppTabCoordinator() -> AppTabCoordinator {
        
        
        let newsListViewFactory = NewsListViewFactory()
        let newsListViewModelFactory = NewsListViewModelFactory()
        let newsListCoordinatorFactory = NewsListCoordinatorFactory(newsListViewFactory: newsListViewFactory, newsListViewModelFactory: newsListViewModelFactory)
        let newsListCoordinator = newsListCoordinatorFactory.makeNewsListCoordinator()
        
        let calendarViewModelFactory = CalendarViewModelFactory()
        let calendarViewFactory = CalendarViewFactory(calendarViewModelFactory: calendarViewModelFactory)
        let calendarCoordinatorFactory = CalendarCoordinatorFactory(calendarViewFactory: calendarViewFactory)
        let calendarCoordinator = calendarCoordinatorFactory.makeCalendarCoordinator()
        
        let listingViewModelFactory = ListingViewModelFactory()
        let listingViewFactory = ListingViewFactory(listingViewModelFactory: listingViewModelFactory)
        let listingCoordinatorFactory = ListingCoordinatorFactory(listingViewFactory: listingViewFactory)
        let listingCoordinator = listingCoordinatorFactory.makeListingCoordinator()
        
        let messagesViewModelFactory = MessagesViewModelFactory()
        let messagesViewFactory = MessagesViewFactory(messagesViewModelFactory: messagesViewModelFactory)
        let messagesCoordinatorFactory = MessagesCoordinatorFactory(messagesViewFactory: messagesViewFactory)
        let messagesCoordinator = messagesCoordinatorFactory.makeMessagesCoordinator()
        
        let menuViewModelFactory = MenuViewModelFactory()
        let menuViewFactory = MenuViewFactory(menuViewModelFactory: menuViewModelFactory)
        let menuCoordinatorFactory = MenuCoordinatorFactory(menuViewFactory: menuViewFactory)
        let menuCoordinator = menuCoordinatorFactory.makeMenuCoordinator()
        
        let viewFactory = AppTabViewFactory(newsListCoordinator: newsListCoordinator,
                                                  calendarCoordinator: calendarCoordinator,
                                                  listingCoordinator: listingCoordinator,
                                                  messagesCoordinator: messagesCoordinator,
                                                  menuCoordinator: menuCoordinator)
        
        return AppTabCoordinator(appTabViewFactory: viewFactory)
    }
}
