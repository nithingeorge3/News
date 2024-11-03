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
    private weak var navigationCoordinator: NavigationCoordinator?
    
    init(navigationCoordinator: NavigationCoordinator) {
        self.navigationCoordinator = navigationCoordinator
    }
    
    func makeLoginViewModel() -> LoginViewModel {
        let viewModel = LoginViewModel()
        viewModel.navigationCoordinator = navigationCoordinator
        return viewModel
    }
}
