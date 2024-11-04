//
//  LoginViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

protocol LoginViewModelFactory {
    func makeLoginViewModel() -> any LoginViewModelProtocol
}

class DefaultLoginViewModelFactory: LoginViewModelFactory {
    func makeLoginViewModel() -> any LoginViewModelProtocol {
        return LoginViewModel()
    }
}
