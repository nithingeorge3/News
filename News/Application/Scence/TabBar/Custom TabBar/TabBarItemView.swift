//
//  TabBarItemView.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI

struct TabBarItemView: View {
    let tab: TabItem
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 2) { // Reduced spacing between icon and label
            ZStack {
                Image(systemName: tab.icon)
                    .font(.system(size: 18)) // Slightly smaller icon size
                    .foregroundColor(isSelected ? tab.color : .gray)
                
                if let badge = tab.badgeCount, badge > 0 {
                    Text("\(badge)")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 8, y: -8) // Adjusted badge position
                }
            }
            Text(tab.title)
                .font(.caption2) // Slightly smaller label font
                .foregroundColor(isSelected ? tab.color : .gray)
        }
        .padding(.vertical, 4) // Reduced vertical padding
        .frame(maxWidth: .infinity)
    }
}
