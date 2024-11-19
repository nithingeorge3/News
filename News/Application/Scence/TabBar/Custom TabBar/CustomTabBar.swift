//
//  CustomTabBar.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: UUID
    let tabs: [TabItem]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(tabs) { tab in
                    TabBarItemView(tab: tab, isSelected: tab.id == selectedTab)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedTab = tab.id
                            }
                        }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
        }
        .background(Color.white)
        .padding(.bottom, safeAreaInsets().bottom)
    }
    
    private func safeAreaInsets() -> UIEdgeInsets {
        guard let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .first else {
            return .zero
        }
        return window.safeAreaInsets
    }
}
