//
//  BaseCoordinators.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI
import Combine

protocol Coordinator: ObservableObject {
    associatedtype ContentViewType: View
    func start() -> ContentViewType
}
