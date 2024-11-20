//
//  LoginViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI
import Combine

//    func makeLoginView(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> LoginView

protocol LoginViewFactoryType {
    func makeLoginView() -> LoginView
}

class LoginViewFactory: LoginViewFactoryType {
    
    private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    func makeLoginView() -> LoginView {
        return LoginView(viewModel: viewModel)
    }
}

