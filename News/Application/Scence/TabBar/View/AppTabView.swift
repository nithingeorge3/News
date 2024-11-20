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
