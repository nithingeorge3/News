//
//  CalendarViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol CalendarViewFactoryType {
    func makeCalendarView(calendarViewModelFactory: CalendarViewModelFactoryType) -> CalendarView
}

class CalendarViewFactory: CalendarViewFactoryType {
    
    func makeCalendarView(calendarViewModelFactory: CalendarViewModelFactoryType) -> CalendarView {
        CalendarView(viewModel: calendarViewModelFactory.makeCalanderViewModel())
    }
}
