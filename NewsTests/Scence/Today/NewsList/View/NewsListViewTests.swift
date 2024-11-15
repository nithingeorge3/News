//
//  NewsListViewTests.swift
//  News
//
//  Created by Nitin George on 12/11/2024.
//

import Combine
import Foundation
import XCTest
import NetworkModule
import SnapshotTesting
import SwiftUI

@testable import News

final class NewsListViewTests: XCTestCase {
    
    private var viewModel: NewsListViewModel!
    private var service: ArticleServiceType!
    private var parser: ArticleServiceParserType!
    private var cancellables: Set<AnyCancellable>!
        
    // Create a custom configuration for iPhone 14
    let config = ViewImageConfig(
        size: CGSize(width: 390, height: 844),
        traits: .init(userInterfaceStyle: .light)
    )
    
    override func setUp() {
        super.setUp()
        parser = MockArticleServiceParser()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        service = nil
        parser = nil
        cancellables = nil
        super .tearDown()
    }
    
    func testListView_API_Success() throws {
        service = MockArticleService(parser: parser, jsonFileName: "MockArticles_Success")
        viewModel = NewsListViewModel(articleService: service)
        
        let view = NewsListView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        
        // Take the snapshot right after viewModel.getArticles() is called
        viewModel.getArticles()
        
        _ = view.onAppear()
        
        let expectation = XCTestExpectation(description: "API call")
        
        viewModel.$state
            .sink { state in
                if case .success = state {
                    assertSnapshot(of: hostingController, as: .image(on: self.config))
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
                
        wait(for: [expectation], timeout: 3)
    }
    
    func testListView_API_failure() throws {
        service = MockArticleService(parser: parser, jsonFileName: "MockArticles_Error")
        viewModel = NewsListViewModel(articleService: service)
        
        let view = NewsListView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        
        // Take the snapshot right after viewModel.getArticles() is called
        viewModel.getArticles()
        
        _ = view.onAppear()
        
        let expectation = XCTestExpectation(description: "API call parse error")
        
        viewModel.$state
            .sink { state in
                if case .failed = state {
                    assertSnapshot(of: hostingController, as: .image(on: self.config))
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
                
        wait(for: [expectation], timeout: 3)
    }
    
    func testListView_API_Empty_Articles() throws {
        service = MockArticleService(parser: parser, jsonFileName: "MockArticles_Empty")
        viewModel = NewsListViewModel(articleService: service)
        
        let view = NewsListView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        
        // Take the snapshot right after viewModel.getArticles() is called
        viewModel.getArticles()
        
        _ = view.onAppear()
        
        let expectation = XCTestExpectation(description: "API call with empty Articles")
        
        viewModel.$state
            .sink { state in
                if case .success = state {
                    assertSnapshot(of: hostingController, as: .image(on: self.config))
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
                
        wait(for: [expectation], timeout: 3)
    }
}
