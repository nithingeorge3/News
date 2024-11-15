//
//  CalendarCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol CalendarCoordinatorFactoryTye {
    func makeCalendarCoordinator() -> CalendarCoordinator
}

class CalendarCoordinatorFactory: CalendarCoordinatorFactoryTye {
    
    private var calendarViewFactory: CalendarViewFactoryType
    private var calendarViewModelFactory: CalendarViewModelFactory
    
    init(calendarViewFactory: CalendarViewFactoryType, calendarViewModelFactory: CalendarViewModelFactory) {
        self.calendarViewFactory = calendarViewFactory
        self.calendarViewModelFactory = calendarViewModelFactory
    }
    
    func makeCalendarCoordinator() -> CalendarCoordinator {
        CalendarCoordinator(calendarViewFactory: calendarViewFactory, calenderViewModelFactory: calendarViewModelFactory)
    }
}
