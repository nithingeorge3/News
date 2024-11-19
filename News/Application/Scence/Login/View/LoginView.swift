//
//  LoginView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

//protocol LoginViewProtocol: View {
//    var viewModel: LoginViewModel { get }
//}
//
struct LoginView: View {//}, LoginViewProtocol {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("LoginView Title")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Username Title")
                    .font(.headline)
                    .foregroundColor(.black)
                
                TextField("Login Username placeholder", text: $viewModel.username)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                
                Text("Password Title")
                    .font(.headline)
                    .foregroundColor(.black)
                
                HStack {
                    if viewModel.isPasswordVisible {
                        TextField("Login Password placeholder", text: $viewModel.password)
                    } else {
                        SecureField("Login Password placeholder", text: $viewModel.password)
                    }
                    Button(action: {
                        viewModel.togglePasswordVisibility()
                    }) {
                        Image(systemName: viewModel.isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal)
            
            Button(action: {
                viewModel.login()
            }) {
                Text("Login Button Title")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Text("Create new account title")
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Handle sign up action here
                }) {
                    Text("Sign Up buttton title")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 40)
        }
        .navigationTitle("LOGIN")
        .padding()
    }
}

//#Preview {
//    LoginView(viewModel: LoginViewModel())
//}
