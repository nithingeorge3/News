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
    private var messagesViewModelFactory: MessagesViewModelFactoryType
    
    init(messagesViewFactory: MessagesViewFactoryType, messagesViewModelFactory: MessagesViewModelFactoryType) {
        self.messagesViewFactory = messagesViewFactory
        self.messagesViewModelFactory = messagesViewModelFactory
    }
    
    func makeMessagesCoordinator() -> MessagesCoordinator {
        MessagesCoordinator(messagesViewfactory: messagesViewFactory, messagesViewModelFactory: messagesViewModelFactory)
    }
}
