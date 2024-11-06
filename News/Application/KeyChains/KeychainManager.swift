//
//  KeychainManager.swift
//  News
//
//  Created by Nitin George on 06/11/2024.
//

import KeychainSwift
import SwiftUI

final class KeychainManager {
    
    private let keychain: KeychainSwift
    
    init() {
        keychain = KeychainSwift()
        keychain.synchronizable = true
    }
    
    func set(_ value: String, for key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(for key: String) -> String? {
        keychain.get(key)
    }
}


struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get { self[KeychainManagerKey.self] }
        set { self[KeychainManagerKey.self] = newValue }
    }
}

/*
 //TEST
 struct TestKeychain : View {
     
     @Environment(\.keychain) var keychain
     
     @ObservedObject var viewModel: HomeViewModel

     @State private var password: String = ""

     var body: some View {
         
         Button(password) {
             keychain.set("Test123000*o", for: "password_key")
             self.password = keychain.get(for: "password_key") ?? "Set Password"
         }
         .padding()
         .onAppear() {
             self.password = keychain.get(for: "password_key") ?? "Set Password"
         }
     }
 }
 
 #Preview {
     TestKeychain()
 }
 
 */
