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
    
    init(messagesViewfactory: MessagesViewFactoryType) {
        self.messagesViewfactory = messagesViewfactory
    }
    
    func start() -> some View {
        messagesViewfactory.makeMessagesView()
    }
}
