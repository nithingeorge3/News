//
//  Untitled.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import Combine

enum AppRoute: Hashable {
    case login
    case dashboard
}

class NavigationCoordinator: ObservableObject {
    @Published var path: [AppRoute] = []
    
    func goToLogin() {
        path = [.login]
    }
    
    func goToDashboard() {
        path.append(.dashboard)
    }
}

