//
//  LoginView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)
                .padding()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Login") {
                viewModel.login()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
