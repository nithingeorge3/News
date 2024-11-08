//
//  LoginViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

protocol LoginViewModelFactoryType {
    func makeLoginViewModel() -> any LoginViewModelProtocol
}

class LoginViewModelFactory: LoginViewModelFactoryType {
    func makeLoginViewModel() -> any LoginViewModelProtocol {
        return LoginViewModel()
    }
}
