//
//  LoginView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

protocol LoginViewProtocol: View {
    var viewModel: LoginViewModel { get }
}

struct LoginView: View, LoginViewProtocol {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)
                .padding()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Login Button Title") {
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
