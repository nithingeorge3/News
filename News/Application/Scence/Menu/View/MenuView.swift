//
//  MenuView.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

struct SidebarItem: Identifiable {
    let id = UUID()
    let title: String
}

struct MenuView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    
    let items = [
        SidebarItem(title: "Item 1"),
        SidebarItem(title: "Item 2")
    ]

    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) { // Adjusted spacing between List and button
                // List of items
                List(items) { item in
                    NavigationLink(destination: EmptyView()) {
                        Text("TEST")
                            .font(.headline)
                            .padding()
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Sidebar")

                // Logout Button directly below the List
                NewsButton(
                    title: "LogOut",
                    backgroundColor: .black,
                    textColor: .white,
                    cornerRadius: 12
                ) {
                    viewModel.performLogOut()
                }
                .padding(.horizontal)
                .padding(.bottom, 40) // Optional: Add spacing from the bottom
            }
            .padding(.top, 10) // Optional: Add padding at the top of the VStack
        }
    }
}

#Preview {
    MenuView(viewModel: MenuViewModel())
}
