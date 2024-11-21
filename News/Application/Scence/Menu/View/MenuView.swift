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
    private let logOutSubject = PassthroughSubject<Void, Never>()
    private let cancelSubject = PassthroughSubject<Void, Never>()
    private let cancellables = Set<AnyCancellable>()
    
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

                LogOutButton(
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
                    BottomLogOutSheet(logOutSubject: logOutSubject, cancelSubject: cancelSubject)
                    .background(Color.clear)
                    .presentationDetents([.fraction(0.25)])
                    .presentationBackground(Color.clear)
                })
            }
            .padding(.top, 10)
        }
        .onReceive(logOutSubject) { _ in  //IMP .sink is Best for ViewModels and logic
            showBottomSheet = false
            viewModel.performLogOut()
        }
        .onReceive(cancelSubject) { _ in
            showBottomSheet = false
        }
    }
}

#Preview {
    let navigationSubject = PassthroughSubject<LoginRoute, Never>()
    MenuView(viewModel: MenuViewModel(onNavigationSubject: navigationSubject))
}
