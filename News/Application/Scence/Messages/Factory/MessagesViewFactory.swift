//
//  MessagesViewFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

protocol MessagesViewFactoryType {
    var messagesViewModel: MessagesViewModel { get }
    func makeMessagesView() -> MessagesView
}

class MessagesViewFactory: MessagesViewFactoryType {
    
    var messagesViewModel: MessagesViewModel
    
    init(messagesViewModel: MessagesViewModel) {
        self.messagesViewModel = messagesViewModel
    }
    
    func makeMessagesView() -> MessagesView {
        MessagesView(viewModel: messagesViewModel)
    }
}
