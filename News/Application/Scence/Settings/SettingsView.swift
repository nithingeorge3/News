//
//  Setting.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct SidebarItem: Identifiable {
    let id = UUID()
    let title: String
}

struct SettingsView: View {
    let items = [
        SidebarItem(title: "Item 1"),
        SidebarItem(title: "Item 2")
    ]
    
    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink(destination: SettingsDetailView(itemTitle: item.title)) {
                    Text(item.title)
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle("Sidebar")
            .listStyle(.plain)
        }
    }
}

struct SettingsDetailView: View {
    let itemTitle: String

    var body: some View {
        Text("Details for \(itemTitle)")
            .font(.largeTitle)
            .padding()
            .navigationTitle(itemTitle)
    }
}

#Preview {
    SettingsView()
}
