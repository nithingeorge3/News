//
//  TabItem.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let badgeCount: Int?
    let color: Color
}
