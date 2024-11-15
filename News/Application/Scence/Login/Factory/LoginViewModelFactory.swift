//
//  LoginViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

protocol LoginViewModelFactoryType {
    func makeLoginViewModel() -> LoginViewModel
}

class LoginViewModelFactory: LoginViewModelFactoryType {
    func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel()
    }
}
