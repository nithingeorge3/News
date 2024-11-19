//
//  LoginViewFactory.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import SwiftUI
import Combine

protocol LoginViewFactoryType {
    func makeLoginView(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> LoginView
}

//class LoginViewFactory: LoginViewFactoryType {
//    
//    private var loginViewModel: LoginViewModelFactory
//    
//    init(loginViewModel: LoginViewModelFactory) {
//        self.loginViewModel = loginViewModel
//    }
//    
//    func makeLoginView(navigationSubject: PassthroughSubject<LoginRoute, Never>) -> LoginView {
//        let viewModel = loginViewModel.makeLoginViewModel()
//        
//        viewModel.navigationSubject = navigationSubject
//        
//        return LoginView(viewModel: viewModel)
//    }
//}

