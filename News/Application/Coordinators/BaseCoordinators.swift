//
//  BaseCoordinators.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

protocol Coordinator {
    associatedtype ContentViewType: View
    func start() -> ContentViewType
}

// Type-erased wrapper for Coordinator, compatible with AnyView
struct AnyCoordinator<T: View>: Coordinator {
    private let _start: () -> T
    
    init<C: Coordinator>(_ coordinator: C) where C.ContentViewType == T {
        // Wraps the coordinator's start method to match the required type
        self._start = coordinator.start
    }
    
    init<C: Coordinator>(_ coordinator: C) where C.ContentViewType: View, T == AnyView {
        // Type-erased initializer, wrapping `start()` result in AnyView
        self._start = { AnyView(coordinator.start()) }
    }
    
    func start() -> T {
        return _start()
    }
}

class BaseCoordinator: Coordinator {
    func start() -> some View {
        EmptyView()
    }
}
