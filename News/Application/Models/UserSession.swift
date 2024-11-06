//
//  UserSession.swift
//  News
//
//  Created by Nitin George on 06/11/2024.
//
import Foundation
import KeychainAccess
import Combine

protocol UserSessionType: AnyObject {
    var user: User? { get }
    var accessToken: String? { get }
    func clearSession()
}

public final class UserSession: UserSessionType {
    
    private let keychain: KeychainType
    private let userDefault: UserDefaults
    
    private let storage = CurrentValueSubject<User?, Never>(nil)

    
    var user: User? {
        get {
            storage.value
        }
        set {
            storage.value = newValue
        }
    }
    
    var accessToken: String?
    
    
    func clearSession() {
        
    }
    
    // MARK: - Initialisation
    
    init(
        keychain: KeychainType,
        userDefault: UserDefaults
    ) {
        self.keychain = keychain
        self.userDefault = userDefault
        
        do {
            user = try retrive()
        } catch {
            assertionFailure("Unable to fetch user object, error: \(error)")
        }
    }
    
   private func retrive() throws -> User? {
       try keychain.getUser()
    }
}
