//
//  LoginViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import Combine

protocol LoginViewModelFactoryType {
    func makeLoginViewModel() -> LoginViewModel
}

class LoginViewModelFactory: LoginViewModelFactoryType {
    
    private let navigationSubject: PassthroughSubject<LoginRoute, Never>
    
    init(navigationSubject: PassthroughSubject<LoginRoute, Never>) {
        self.navigationSubject = navigationSubject
    }
    
    func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel(onNavigationSubject: navigationSubject)
    }
}
