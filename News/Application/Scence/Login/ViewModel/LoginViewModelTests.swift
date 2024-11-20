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
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable> = [] //for managing Combine subscriptions
    let navigationSubject = PassthroughSubject<LoginRoute, Never>()
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel(onNavigationSubject: navigationSubject)
    }

    override func tearDown() {
        viewModel = nil
        cancellables.removeAll()
        super.tearDown()
    }

    func testPasswordVisibilityToggle() {
        let expectation1 = XCTestExpectation(description: "Password should not be visible in the first time")
        let expectation2 = XCTestExpectation(description: "Password should be visible after first toggle")
        let expectation3 = XCTestExpectation(description: "Password should be hidden after second toggle")
        
        var visibilityStates: [Bool] = []
        
        viewModel.$isPasswordVisible
            .sink { isVisible in
                visibilityStates.append(isVisible)
                
                if visibilityStates == [false] {
                    expectation1.fulfill()
                }
                if visibilityStates == [false, true] {
                    expectation2.fulfill()
                } else if visibilityStates == [false, true, false] {
                    expectation3.fulfill()
                }
            }
            .store(in: &cancellables) // Correctly store in the instance property cancellables
        
        // Perform toggle actions
        viewModel.togglePasswordVisibility() // Expect isPasswordVisible to be `true`
        viewModel.togglePasswordVisibility() // Expect isPasswordVisible to be `false`
        
        wait(for: [expectation1, expectation2], timeout: 1.0)
        
        // Verify final state
        XCTAssertEqual(visibilityStates, [false, true, false], "Expected visibility states to toggle correctly")
    }
}
