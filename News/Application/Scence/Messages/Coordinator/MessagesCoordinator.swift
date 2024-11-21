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
    
    private let _tabItem: TabItem
    let messagesViewModel: MessagesViewModel
    var messagesViewfactory: MessagesViewFactoryType
    var cancellables: Set<AnyCancellable> = []
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(messagesViewfactory: MessagesViewFactoryType, tabItem: TabItem) {
        self.messagesViewfactory = messagesViewfactory
        _tabItem = tabItem
        self.messagesViewModel = self.messagesViewfactory.messagesViewModel
    }
    
    func start() -> some View {
        MessagesCoordinatorView(messagesCoordinator: self)
    }
}
