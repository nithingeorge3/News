//
//  KeychainStorage.swift
//  News
//
//  Created by Nitin George on 06/11/2024.
//

import KeychainSwift
import SwiftUI

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    
    @State private var newValue: String
    let key: String
    let keychain: KeychainManager
    
    var wrappedValue: String {
        get {
            newValue
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
        })
    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        self.keychain = KeychainManager()
        
        newValue = keychain.get(for: key) ?? ""
        print("SUCCESS READING FROM KEYCHAIN")
    }
    
    func save(newValue: String) {
        keychain.set(newValue, for: key)
        self.newValue = newValue
        print("SUCCESS WRITING TO KEYCHAIN")
    }
}

/*
 //Test
 struct TestKeychain: View {
     
     @KeychainStorage("password_key") var userPassword: String = ""
     
     @ObservedObject var viewModel: HomeViewModel

     @State private var password: String = ""

     var body: some View {
         
         Button(userPassword) {
             userPassword = "*****"
         }
         .padding()
         .onAppear() {
             userPassword = "$$$$$"
         }
     }
 }
 
 #Preview {
     TestKeychain()
 }
 
 */
