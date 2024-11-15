//
//  LoginViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI

protocol LoginViewFactoryType {
    func makeLoginView(onNavigation: @escaping (LoginRoute) -> Void) -> LoginView
}

class LoginViewFactory: LoginViewFactoryType {
    
    private var loginViewModel: LoginViewModelFactory
    
    init(loginViewModel: LoginViewModelFactory) {
        self.loginViewModel = loginViewModel
    }
    
    func makeLoginView(onNavigation: @escaping (LoginRoute) -> Void) -> LoginView {
        let viewModel = loginViewModel.makeLoginViewModel()
        
        // Subscribe to navigation events
        viewModel.navigationPublisher
            .sink(receiveValue: onNavigation)
            .store(in: &viewModel.cancellables)
        
        return LoginView(viewModel: viewModel)
    }
}

