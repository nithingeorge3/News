//
//  MessagesViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

protocol MessagesViewFactoryType {
    func makeMessagesView() -> MessagesView
}

class MessagesViewFactory: MessagesViewFactoryType {
    
    private var messagesViewModel: MessagesViewModel
    
    init(messagesViewModel: MessagesViewModel) {
        self.messagesViewModel = messagesViewModel
    }
    
    func makeMessagesView() -> MessagesView {
        MessagesView(viewModel: messagesViewModel)
    }
}
