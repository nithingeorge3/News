//
//  NewsApp.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

@main
struct MyApp: App {
    
    private var appEnvironment: AppEnvironment!
    private var appCoordinator: AppCoordinator!
    
    init() {
        appEnvironment = AppEnvironment.default()
        appCoordinator = appEnvironment.makeAppCoordinator()
    }

    var body: some Scene {
        WindowGroup {
            self.appCoordinator.start()
        }
    }
}
