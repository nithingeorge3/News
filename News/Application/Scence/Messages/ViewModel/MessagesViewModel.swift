//
//  MessagesViewModel.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Combine

class MessagesViewModel: ObservableObject {
    
    @Published var unreadMessagesCount: Int = 0
    
    func fetchUnreadMessages() {
        unreadMessagesCount = 0 // need to impliment API call
    }
}
