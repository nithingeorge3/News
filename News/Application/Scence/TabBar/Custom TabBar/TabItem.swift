//
//  TabItem.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI
import Combine

protocol TabItemProvider: Coordinator {
    var tabItem: TabItem { get }
}

class TabItem: Identifiable, ObservableObject {
    let id = UUID()
    let title: String
    let icon: String
    @Published var badgeCount: Int?
    let color: Color
    
    init(title: String, icon: String, badgeCount: Int?, color: Color) {
        self.title = title
        self.icon = icon
        self.badgeCount = badgeCount
        self.color = color
    }
}
