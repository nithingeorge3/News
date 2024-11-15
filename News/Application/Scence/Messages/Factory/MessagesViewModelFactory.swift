//
//  MessagesViewModelFactory.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

protocol MessagesViewModelFactoryType {
    func makeMessagesViewModel() -> MessagesViewModel
}

class MessagesViewModelFactory: MessagesViewModelFactoryType {
    func makeMessagesViewModel() -> MessagesViewModel {
        return MessagesViewModel()
    }
}
