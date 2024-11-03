//
//  LoginCoordinator.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

class LoginCoordinator: BaseCoordinator {
    private let navigationCoordinator: NavigationCoordinator
    private let viewModelFactory: LoginViewModelFactory
    
    init(navigationCoordinator: NavigationCoordinator, viewModelFactory: LoginViewModelFactory) {
        self.navigationCoordinator = navigationCoordinator
        self.viewModelFactory = viewModelFactory
    }
    
    override func start() {
        navigationCoordinator.goToLogin()
    }
}
