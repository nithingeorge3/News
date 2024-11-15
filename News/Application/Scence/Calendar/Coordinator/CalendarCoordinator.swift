//
//  CalendarCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class CalendarCoordinator: Coordinator {
    
    private var calendarViewFactory: CalendarViewFactory
    private var calenderViewModelFactory: CalendarViewModelFactory
    
    init(calendarViewFactory: CalendarViewFactory, calenderViewModelFactory: CalendarViewModelFactory) {
        self.calendarViewFactory = calendarViewFactory
        self.calenderViewModelFactory = calenderViewModelFactory
    }
    
    func start() -> some View {
        calendarViewFactory.makeCalendarView(calendarViewModelFactory: calenderViewModelFactory)
    }
}
