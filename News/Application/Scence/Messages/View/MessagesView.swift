//
//  MessagesView.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var viewModel: MessagesViewModel
    
    init(viewModel: MessagesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("MessagesView")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}
