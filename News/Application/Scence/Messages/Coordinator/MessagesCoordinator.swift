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

class MessagesCoordinator: Coordinator {
    
    private var messagesViewfactory: MessagesViewFactoryType
    private var messagesViewModelFactory: MessagesViewModelFactoryType
    
    init(messagesViewfactory: MessagesViewFactoryType, messagesViewModelFactory: MessagesViewModelFactoryType) {
        self.messagesViewfactory = messagesViewfactory
        self.messagesViewModelFactory = messagesViewModelFactory
    }
    
    func start() -> some View {
        messagesViewfactory.makeMessagesView(messagesViewModelFactory: messagesViewModelFactory)
    }
}
