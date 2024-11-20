//
//  MenuView.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI
import Combine

struct SidebarItem: Identifiable {
    let id = UUID()
    let title: String
}

struct MenuView: View {
    
    @State private var showBottomSheet = false
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
                    showBottomSheet.toggle()
                }
                .padding(.horizontal)
                .padding(.bottom, 40) // Optional: Add spacing from the bottom
                
                .sheet(isPresented: $showBottomSheet, content: {
                    BottomLogOutSheet(
                        onLogout: {
                            print("Logged Out")
                            showBottomSheet = false
                            viewModel.performLogOut()
                        },
                        onCancel: {
                            print("Cancelled")
                            showBottomSheet = false
                        }
                    )
                    .background(Color.clear) // Transparent background for the sheet
                    .presentationDetents([.fraction(0.25)]) // Adjust height dynamically
                    .presentationBackground(Color.clear) // Clear sheet background
//                    .presentationCornerRadius(20) // Rounded corners
                })
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    let navigationSubject = PassthroughSubject<LoginRoute, Never>()
    MenuView(viewModel: MenuViewModel(onNavigationSubject: navigationSubject))
}
