//
//  LoginViewModel.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

protocol LoginViewModelType: ObservableObject {
    // Input
    var username: String { get set }
    var password: String { get set }
    
    // Output
    var isPasswordVisible: Bool { get  set }
    var isLoginButtonEnabled: Bool { get }
    var isLoggedIn: Bool { get }
    
    // Actions
    func login()
    func togglePasswordVisibility()
    
    var navigationPublisher: PassthroughSubject<Void, Never> { get set }
    
    var cancellables: Set<AnyCancellable> { get set }
}

class LoginViewModel: ObservableObject {
        
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: Error?
    
    @Published var isPasswordVisible: Bool = false
    @Published var isLoginButtonEnabled: Bool = false
    @Published var isLoggedIn: Bool = false
    
    var navigationPublisher = PassthroughSubject<LoginRoute, Never>()
    
    var cancellables = Set<AnyCancellable>()
        
    func login() {
        // Perform validation or network request
        // For simplicity, assume login is always successful
        navigationPublisher.send(.newsList)
    }
    
    func togglePasswordVisibility() {
        isPasswordVisible.toggle()
    }
    
}
