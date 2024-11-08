//
//  AppEnvironment.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import Foundation
import KeychainAccess

struct AppEnvironment {
    let userSession: UserSessionType
}

extension AppEnvironment {
    
    static func `default`() -> AppEnvironment {
        
        let standardUserDefaults = UserDefaults.standard
        
        let userSession = UserSession(
            keychain: Keychain.shared(),
            userDefault: standardUserDefaults
        )
            
        return AppEnvironment(
            userSession: userSession
        )
    }
}
