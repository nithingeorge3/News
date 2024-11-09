//
//  MockNavigationCoordinator.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

class MockNavigationCoordinator: NavigationCoordinator {
    var didNavigateToHome = false
    
    override func goToDashboard() {
        didNavigateToHome = true
    }
}
