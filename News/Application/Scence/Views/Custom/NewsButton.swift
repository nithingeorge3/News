//
//  NewsButton.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

import SwiftUI

public struct NewsButton: View {
    
    let title: String
    let action: () -> Void
    let backgroundColor: Color
    let textColor: Color
    let cornerRadius: CGFloat

    @State private var isPressed = false
    
    init(
        title: String,
        backgroundColor: Color = .red,
        textColor: Color = .white,
        cornerRadius: CGFloat = 10,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                action()
            }
        }) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isPressed ? backgroundColor.opacity(0.8) : backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(cornerRadius)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                .scaleEffect(isPressed ? 0.95 : 1.0) // Adds press animation
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: isPressed)
    }
}
