//
//  LoginViewModelFactory.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

protocol LoginViewModelFactory {
    func makeLoginViewModel() -> LoginViewModel
}

class DefaultLoginViewModelFactory: LoginViewModelFactory {
    func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel()
    }
}
