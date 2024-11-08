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
    private var appCoordinator: AnyCoordinator<AnyView>
    
    init() {
        appEnvironment = AppEnvironment.default()
        appCoordinator = AnyCoordinator(appEnvironment.makeAppCoordinator())
    }

    var body: some Scene {
        WindowGroup {
            self.appCoordinator.start()
        }
    }
}
