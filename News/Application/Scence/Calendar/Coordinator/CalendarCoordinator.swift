//
//  CalendarCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class CalendarCoordinator: Coordinator, TabItemProvider {
    
    private var calendarViewFactory: CalendarViewFactoryType
    private let _tabItem: TabItem
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(calendarViewFactory: CalendarViewFactoryType, tabItem: TabItem) {
        self.calendarViewFactory = calendarViewFactory
        _tabItem = tabItem
    }
    
    func start() -> some View {
        calendarViewFactory.makeCalendarView()
    }
}
