//
//  Keychain.swift
//  News
//
//  Created by Nitin George on 06/11/2024.
//

import Foundation
import KeychainAccess
import Combine

private let userKeychainKey: String = "codable_user_Keychain_Key"

protocol KeychainType {
    typealias Credentials = (username: String, password: String)
    
    func object<T: Decodable>(forkey key: String) throws -> T?
    func set<T: Encodable>(_ object: T, forkey key: String) throws
    
    func setSharedPassword(username: String, password: String)
    func getSharedPassword() -> Future<KeychainType.Credentials?, Error>
    
    func setUser<User: Encodable>(_ user: User) throws
    func getUser<User: Decodable>() throws -> User?
}

extension Keychain: KeychainType {
    
    public static func shared() -> Keychain {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("Bundle identifier is not set")
        }
        
        return Keychain(service: bundleIdentifier)
    }
    
    func object<T>(forkey key: String) throws -> T? where T : Decodable {
        guard let data = try getData(key) else {
            return nil
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func set<T>(_ object: T, forkey key: String) throws where T : Encodable {
        let data = try JSONEncoder().encode(object)
        try set(data, key: key)
    }
    
    func setSharedPassword(username: String, password: String) {
        
        self.setSharedPassword(password, account: username) { error in
        
            if let error = error {
                print("Error setting shared password: \(error)")
            }
            else {
                    print("Shared password set successfully")
                }
        }
    }
    
    func getSharedPassword() -> Future<KeychainType.Credentials?, Error> {
        
        return Future<KeychainType.Credentials?, Error> { promise in
            
            self.getSharedPassword { username, password, error in
                
                if let error = error {
                    promise(.failure(error))
                }
                else if let username = username, let password = password {
                    promise(.success((username, password)))
                }
                else {
                    promise(.success(nil))
                }
            }
        }
    }

    
    func setUser<User: Encodable>(_ user: User) throws {
        try set(user, forkey: userKeychainKey)
    }
    
    func getUser<User: Decodable>() throws -> User? {
        try object(forkey: userKeychainKey)
    }
}

/*
 func setUser<User>(_ user: User) throws where User : Encodable {
     
 }
 
 func getUser<User>() throws -> User? where User : Decodable {
     
 }
 */
