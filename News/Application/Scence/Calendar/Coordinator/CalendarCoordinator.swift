//
//  CalendarCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

class CalendarCoordinator: Coordinator {
    
    private var calendarViewFactory: CalendarViewFactoryType
    
    init(calendarViewFactory: CalendarViewFactoryType) {
        self.calendarViewFactory = calendarViewFactory
    }
    
    func start() -> some View {
        calendarViewFactory.makeCalendarView()
    }
}
