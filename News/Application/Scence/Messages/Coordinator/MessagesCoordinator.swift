//
//  MessagesCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI
import Combine

protocol MessagesCoordinatorType {
    func makeMessageCoordinator() -> MessagesCoordinator
}

class MessagesCoordinator: Coordinator, TabItemProvider {
    
    let messagesViewModel: MessagesViewModel
    var messagesViewfactory: MessagesViewFactoryType
    private let _tabItem: TabItem
    var cancellables: Set<AnyCancellable> = []
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(messagesViewfactory: MessagesViewFactoryType, tabItem: TabItem) {
        self.messagesViewfactory = messagesViewfactory
        _tabItem = tabItem
        self.messagesViewModel = MessagesViewModelFactory().makeMessagesViewModel()
    }
    
    func start() -> some View {
        MessagesCoordinatorView(messagesCoordinator: self)
    }
}


class MessagesCoordinator1: Coordinator, TabItemProvider {
    
    let messagesViewModel: MessagesViewModel
    var messagesViewfactory: MessagesViewFactoryType
    private let _tabItem: TabItem
    var cancellables: Set<AnyCancellable> = []
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(messagesViewfactory: MessagesViewFactoryType, tabItem: TabItem) {
        self.messagesViewfactory = messagesViewfactory
        _tabItem = tabItem        
        self.messagesViewModel = MessagesViewModelFactory().makeMessagesViewModel()
        
        // Bind badge count from ViewModel to TabItem
        self.messagesViewModel.$unreadMessagesCount
            .sink { [weak self] count in
                self?._tabItem.badgeCount = count
            }
            .store(in: &cancellables)
    }
    
    func start() -> some View {
//        MessagesCoordinatorView(messagesCoordinator: self)
        messagesViewfactory.makeMessagesView()
    }
    
    func observeUnreadMessages() {
        messagesViewModel.$unreadMessagesCount
            .receive(on: DispatchQueue.main) // Ensure updates are on the main thread
            .sink { [weak self] count in
                self?._tabItem.badgeCount = count
            }
            .store(in: &cancellables)
    }
}
