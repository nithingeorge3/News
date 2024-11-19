//
//  AppTabView.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//

import SwiftUI
import NetworkModule

struct AppTabView: View {
    @State private var selectedTab: UUID
    private let tabProvider: TabProvider
    let tabs: [TabItem]

    init(tabs: [TabItem], tabProvider: TabProvider) {
        self.tabs = tabs
        self.tabProvider = tabProvider
        _selectedTab = State(initialValue: tabs.first!.id)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Dynamic Tab Content
            ZStack {
                tabProvider.view(for: selectedTab)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)

            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab, tabs: tabs)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AppTabView1: View {
    @State private var selectedTab: UUID
    
    let tabs: [TabItem] = [
        TabItem(title: "Today", icon: "checkmark.square", badgeCount: nil, color: .black),
        TabItem(title: "Calendar", icon: "calendar", badgeCount: nil, color: .black),
        TabItem(title: "Listings", icon: "house", badgeCount: nil, color: .black),
        TabItem(title: "Messages", icon: "message", badgeCount: 1, color: .black),
        TabItem(title: "Menu", icon: "line.horizontal.3", badgeCount: nil, color: .black)
    ]
    
    init() {
        _selectedTab = State(initialValue: tabs.first!.id)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Display appropriate view based on selected tab
            ZStack {
                switch selectedTab {
                case tabs[0].id: NewsListView(viewModel: NewsListViewModel(articleService: ArticleServiceFactory.articleService()))
                case tabs[1].id: CalendarView(viewModel: CalendarViewModel())
                case tabs[2].id: ListingView(viewModel: ListingViewModel())
                case tabs[3].id: MessagesView(viewModel: MessagesViewModel())
                case tabs[4].id: MenuView(viewModel: MenuViewModel())
                default:
                    Text("Unknown Tab")
                        .foregroundColor(.red)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab, tabs: tabs)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
