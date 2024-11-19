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

    private var coordinators: [any TabItemProvider]
    
    init(coordinators: [any TabItemProvider]) {
        self.coordinators = coordinators
    }
    
    var tabs: [TabItem] {
        coordinators.map { $0.tabItem }
    }
    
    func makeAppTabView() -> AppTabView {
        AppTabView(
            tabs: tabs,
            tabProvider: self // The factory acts as the TabProvider
        )
    }
}

extension AppTabViewFactory: TabProvider {
    
    func view(for tabID: UUID) -> AnyView {
        // Find the coordinator whose `tabItem` matches the `tabID`
        guard let coordinator = coordinators.first(where: { $0.tabItem.id == tabID }) else {
            return AnyView(Text("Unknown Tab").foregroundColor(.black)) // Fallback view
        }
        return coordinator.start() as! AnyView // Generate the view using the coordinator
    }
}
