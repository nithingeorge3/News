//
//  MessagesCoordinatorView.swift
//  News
//
//  Created by Nitin George on 20/11/2024.
//

import SwiftUI
import Combine

struct MessagesCoordinatorView: View {
    @ObservedObject var messagesCoordinator: MessagesCoordinator

    var body: some View {
        messagesCoordinator.messagesViewfactory.makeMessagesView()
        .onAppear {
            messagesCoordinator.messagesViewModel.$unreadMessagesCount
                .sink { count in
                    messagesCoordinator.tabItem.badgeCount = count
                }
                .store(in: &messagesCoordinator.cancellables)
        }
    }
}
