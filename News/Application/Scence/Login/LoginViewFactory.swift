//
//  LoginViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

class LoginViewFactory {
    func makeLoginView(viewModel: LoginViewModel) -> some View {
        LoginView(viewModel: viewModel)
    }
}

