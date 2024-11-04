//
//  LoginViewModelTests.swift
//  News
//
//  Created by Nitin George on 03/11/2024.
//

import XCTest
import Combine

@testable import News

class LoginViewModelTests: XCTestCase {
    func testLogin_NavigatesToHome() {
        // Arrange
        let mockNavigationCoordinator = MockNavigationCoordinator()
        let viewModel = LoginViewModel()
        
        // Act
        viewModel.login()
        
        // Assert
        XCTAssertTrue(mockNavigationCoordinator.didNavigateToHome, "Login should navigate to Home")
    }
}
