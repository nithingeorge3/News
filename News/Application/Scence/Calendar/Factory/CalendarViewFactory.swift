//
//  CalendarViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

class CalendarViewFactory {
    
    func makeCalendarView(calendarViewModelFactory: CalendarViewModelFactoryType) -> CalendarView {
        CalendarView(viewModel: calendarViewModelFactory.makeCalanderViewModel())
    }
}
