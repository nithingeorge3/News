//
//  BottomLogOutSheet.swift
//  News
//
//  Created by Nitin George on 20/11/2024.
//

import SwiftUI
import Combine

import SwiftUI

struct BottomLogOutSheet: View {
    
    let logOutSubject: PassthroughSubject<Void, Never>
    let cancelSubject: PassthroughSubject<Void, Never>
    
//    var onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: 20) { // Use spacing for the gap between buttons
            Button(action: {
                logOutSubject.send()
            }) {
                Text("Log Out")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    )
            }
            
            Button(action: {
                cancelSubject.send()
//                onCancel()
            }) {
                Text("Cancel")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    )
            }
        }
        .padding(.horizontal, 10) // Padding around the VStack
        .padding(.vertical, 10)   // Optional vertical padding
        .background(Color.clear)
        .padding(.horizontal, 10) // Padding for the entire container
    }
}
