//
//  LoginViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

class LoginViewFactory {
    private let viewModelFactory: LoginViewModelFactory
    
    init(viewModelFactory: LoginViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
    
    func makeLoginView() -> some View {
        let viewModel = viewModelFactory.makeLoginViewModel()
        return LoginView(viewModel: viewModel)
    }
}
