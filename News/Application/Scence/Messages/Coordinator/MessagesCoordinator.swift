//
//  MessagesCoordinator.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Foundation
import SwiftUI

protocol MessagesCoordinatorType {
    func makeMessageCoordinator() -> MessagesCoordinator
}

class MessagesCoordinator: Coordinator, TabItemProvider {
    
    private var messagesViewfactory: MessagesViewFactoryType
    private let _tabItem: TabItem
    
    var tabItem: TabItem {
        _tabItem
    }
    
    init(messagesViewfactory: MessagesViewFactoryType, tabItem: TabItem) {
        self.messagesViewfactory = messagesViewfactory
        _tabItem = tabItem
    }
    
    func start() -> some View {
        messagesViewfactory.makeMessagesView()
    }
}
