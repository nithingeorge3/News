//
//  MessagesViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

protocol MessagesViewFactoryType {
    func makeMessagesView(messagesViewModelFactory: MessagesViewModelFactoryType) -> MessagesView
}

class MessagesViewFactory: MessagesViewFactoryType {
    
    private var messagesViewModelFactory: MessagesViewModelFactoryType
    
    init(messagesViewModelFactory: MessagesViewModelFactoryType) {
        self.messagesViewModelFactory = messagesViewModelFactory
    }
    
    func makeMessagesView(messagesViewModelFactory: MessagesViewModelFactoryType) -> MessagesView {
        MessagesView(viewModel: messagesViewModelFactory.makeMessagesViewModel())
    }

}
