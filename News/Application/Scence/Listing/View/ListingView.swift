//
//  ListingView.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import SwiftUI

struct ListingView: View {
    
    @ObservedObject var viewModel: ListingViewModel
    
    init(viewModel: ListingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("ListingView")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.1))
    }
}
