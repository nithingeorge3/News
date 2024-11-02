//
//  LoginView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var isLoginTapped = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    TextField("Username", text: .constant(""))
                        .padding()
                    TextField("Password", text: .constant(""))
                        .padding()
                    
                    Spacer()
                    Button(action: {
                        isLoginTapped = true
                    }) {
                        Text("Login")
                    }
                    .padding()
                    Spacer()
                                        
                    .navigationDestination(isPresented: $isLoginTapped) {
                        HomeView()
                    }
                }
            }
            .navigationTitle("News")
        }
    }
}

#Preview {
    LoginView()
}
