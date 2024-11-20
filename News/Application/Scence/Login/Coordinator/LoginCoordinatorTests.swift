//
//  LoginCoordinatorTests.swift
//  News
//
//  Created by Nitin George on 04/11/2024.
//

import XCTest
import SwiftUI
import Combine

@testable import News

/*

class MockLoginViewModelFactory: LoginViewModelFactory {
    override func makeLoginViewModel() -> LoginViewModel {
        let navigationSubject = PassthroughSubject<LoginRoute, Never>()
        let viewModel = LoginViewModel(onNavigationSubject: navigationSubject)
        // Configure mock behavior if needed
        return viewModel
    }
}

class MockNewsListCoordinatorFactory: NewsListCoordinatorFactory {
    override func makeNewsListCoordinator() -> NewsListCoordinator {
        return NewsListCoordinator(newsListViewFactory: NewsListViewFactory(), newsListViewModelFactory: NewsListViewModelFactory())
    }
}

class LoginCoordinatorTests: XCTestCase {
    func testLoginCoordinator_StartsWithLoginView() {
        
        let navigationSubject = PassthroughSubject<LoginRoute, Never>()
        
        // Arrange
        let navigationCoordinator = NavigationCoordinator()
        let loginViewModelFactory = MockLoginViewModelFactory(navigationSubject: navigationSubject)
        let loginViewFactory = LoginViewFactory(viewModel: loginViewModelFactory.makeLoginViewModel())
                        
        let loginCoordinatorFactory = LoginCoordinatorFactory(
            navigationCoordinator: navigationCoordinator,
            loginViewFactory: loginViewFactory,
            navigationSubject: navigationSubject
        )
        let loginCoordinator = loginCoordinatorFactory.makeLoginCoordinator()

        // Assert
        XCTAssertTrue(loginCoordinator.path.isEmpty, "LoginCoordinator should start with an empty path")
    }
}
*/
