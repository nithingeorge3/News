//
//  LoginViewModel.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var isLoggedIn: Bool = false
    
    weak var navigationCoordinator: NavigationCoordinator?
    
    func login() {
        // Perform validation or network request
        // For simplicity, assume login is always successful
        navigationCoordinator?.goToHome()
    }
    
}
