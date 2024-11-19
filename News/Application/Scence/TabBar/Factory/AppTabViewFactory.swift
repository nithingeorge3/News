//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI
import NetworkModule

protocol TabProvider {
    func view(for tabID: UUID) -> AnyView
}

protocol AppTabViewFactoryType {
    func makeAppTabView() -> AppTabView
}

class AppTabViewFactory: AppTabViewFactoryType {
    
    private var newsListCoordinator: NewsListCoordinator!
    private var calendarCoordinator: CalendarCoordinator!
    private var listingCoordinator: ListingCoordinator!
    private var messagesCoordinator: MessagesCoordinator!
    private var menuCoordinator: MenuCoordinator!
    
    init(newsListCoordinator: NewsListCoordinator,
         calendarCoordinator: CalendarCoordinator,
         listingCoordinator: ListingCoordinator,
         messagesCoordinator: MessagesCoordinator,
         menuCoordinator: MenuCoordinator) {
        self.newsListCoordinator = newsListCoordinator
        self.calendarCoordinator = calendarCoordinator
        self.listingCoordinator = listingCoordinator
        self.messagesCoordinator = messagesCoordinator
        self.menuCoordinator = menuCoordinator
    }
    
    private let tabs: [TabItem] = [
        TabItem(title: "Today", icon: "checkmark.square", badgeCount: nil, color: .black),
        TabItem(title: "Calendar", icon: "calendar", badgeCount: nil, color: .black),
        TabItem(title: "Listings", icon: "house", badgeCount: nil, color: .black),
        TabItem(title: "Messages", icon: "message", badgeCount: 1, color: .black),
        TabItem(title: "Menu", icon: "line.horizontal.3", badgeCount: nil, color: .black)
    ]
    
    // View Models for Each Tab
    private let newsListViewModel = NewsListViewModel(articleService: ArticleServiceFactory.articleService())
    private let calendarViewModel = CalendarViewModel()
    private let listingViewModel = ListingViewModel()
    private let messagesViewModel = MessagesViewModel()
    private let menuViewModel = MenuViewModel()

    func makeAppTabView() -> AppTabView {
        AppTabView(
            tabs: tabs,
            tabProvider: self // The factory acts as the TabProvider
        )
    }
}

extension AppTabViewFactory: TabProvider {
    func view(for tabID: UUID) -> AnyView {
        switch tabID {
        case tabs[0].id:
            AnyView(newsListCoordinator.start())
        case tabs[1].id:
            AnyView(calendarCoordinator.start())
        case tabs[2].id:
            AnyView(listingCoordinator.start())
        case tabs[3].id:
            AnyView(messagesCoordinator.start())
        case tabs[4].id:
            AnyView(menuCoordinator.start())
        default:
            AnyView(Text("Unknown Tab").foregroundColor(.black))
        }
    }
}
