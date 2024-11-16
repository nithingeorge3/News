//
//  CalendarViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol CalendarViewFactoryType {
    func makeCalendarView() -> CalendarView
}

class CalendarViewFactory: CalendarViewFactoryType {
    
    private var calendarViewModelFactory: CalendarViewModelFactoryType
    
    init(calendarViewModelFactory: CalendarViewModelFactoryType) {
        self.calendarViewModelFactory = calendarViewModelFactory
    }
    
    func makeCalendarView() -> CalendarView {
        CalendarView(viewModel: calendarViewModelFactory.makeCalanderViewModel())
    }
}
