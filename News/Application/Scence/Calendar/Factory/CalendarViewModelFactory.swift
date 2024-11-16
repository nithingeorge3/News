//
//  CalandatViewModelFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol CalendarViewModelFactoryType {
    func makeCalanderViewModel() -> CalendarViewModel
}

class CalendarViewModelFactory: CalendarViewModelFactoryType {
    func makeCalanderViewModel() -> CalendarViewModel {
        return CalendarViewModel()
    }
}
