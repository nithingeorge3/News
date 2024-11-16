//
//  MessagesCoordinatorFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MessagesCoordinatorFactoryType {
    func makeMessagesCoordinator() -> MessagesCoordinator
}

class MessagesCoordinatorFactory: MessagesCoordinatorFactoryType {
    
    private var messagesViewFactory: MessagesViewFactoryType
    
    init(messagesViewFactory: MessagesViewFactoryType) {
        self.messagesViewFactory = messagesViewFactory
    }
    
    func makeMessagesCoordinator() -> MessagesCoordinator {
        MessagesCoordinator(messagesViewfactory: messagesViewFactory)
    }
}
