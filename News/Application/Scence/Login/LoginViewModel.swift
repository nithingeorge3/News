//
//  LoginViewModel.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI
import Combine

protocol LoginViewModelProtocol: ObservableObject {
    // Input
    var username: String { get set }
    var password: String { get set }
    
    // Output
    var isLoginButtonEnabled: Bool { get }
    var isLoggedIn: Bool { get }
    
    // Actions
    func login()
    
    var loginSuccessSubject: PassthroughSubject<Void, Never> { get set }
    
    var cancellables: Set<AnyCancellable> { get set }
}

class LoginViewModel: LoginViewModelProtocol {
        
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: Error?
    @Published var isLoginButtonEnabled: Bool = false
    @Published var isLoggedIn: Bool = false
    
    var loginSuccessSubject = PassthroughSubject<Void, Never>()
    
    var cancellables = Set<AnyCancellable>()
        
    func login() {
        // Perform validation or network request
        // For simplicity, assume login is always successful
        loginSuccessSubject.send()
    }
    
}
