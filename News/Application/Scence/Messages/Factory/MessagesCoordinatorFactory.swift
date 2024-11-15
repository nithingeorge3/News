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
    
    private var messagesViewFactory: MessagesViewFactory
    private var messagesViewModelFactory: MessagesViewModelFactoryType
    
    init(messagesViewFactory:MessagesViewFactory, messagesViewModelFactory: MessagesViewModelFactoryType) {
        self.messagesViewFactory = messagesViewFactory
        self.messagesViewModelFactory = messagesViewModelFactory
    }
    
    func makeMessagesCoordinator() -> MessagesCoordinator {
        MessagesCoordinator(messagesViewfactory: messagesViewFactory, messagesViewModelFactory: messagesViewModelFactory)
    }
}
