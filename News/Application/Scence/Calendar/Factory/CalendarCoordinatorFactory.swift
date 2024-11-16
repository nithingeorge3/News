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
    
    init(calendarViewFactory: CalendarViewFactoryType) {
        self.calendarViewFactory = calendarViewFactory
    }
    
    func makeCalendarCoordinator() -> CalendarCoordinator {
        CalendarCoordinator(calendarViewFactory: calendarViewFactory)
    }
}
