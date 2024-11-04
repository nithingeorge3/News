//
//  LoginCoordinatorTests.swift
//  News
//
//  Created by Nitin George on 04/11/2024.
//

import XCTest
import SwiftUI

@testable import News

class MockLoginViewModelFactory: LoginViewModelFactory {
    func makeLoginViewModel() -> any LoginViewModelProtocol {
        let viewModel = LoginViewModel()
        // Configure mock behavior if needed
        return viewModel
    }
}

class MockLoginViewFactory: LoginViewFactory {
    func makeLoginView(viewModel: LoginViewModel) -> some View {
        return EmptyView() // Return a mock view
    }
}

class MockHomeCoordinatorFactory: HomeCoordinatorFactory {
    func makeHomeCoordinator() -> HomeCoordinator {
        return HomeCoordinator(homeViewFactory: HomeViewFactory())
    }
}

class LoginCoordinatorTests: XCTestCase {
    func testLoginCoordinator_StartsWithLoginView() {
        // Arrange
        let navigationCoordinator = NavigationCoordinator()
        let loginViewModelFactory = MockLoginViewModelFactory()
        let loginViewFactory = MockLoginViewFactory()
        let homeCoordinatorFactory = MockHomeCoordinatorFactory()
        let loginCoordinatorFactory = DefaultLoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewModelFactory: loginViewModelFactory,
            loginViewFactory: loginViewFactory,
            homeCoordinatorFactory: homeCoordinatorFactory
        )
        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()

        // Act
//        let _ = loginCoordinator.start()

        // Assert
        XCTAssertTrue(loginCoordinator.path.isEmpty, "LoginCoordinator should start with an empty path")
    }
}
