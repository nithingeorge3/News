//
//  NewsListViewModelTests.swift
//  News
//
//  Created by Nitin George on 12/11/2024.
//

import XCTest
import Combine
import NetworkModule
import SnapshotTesting
import InlineSnapshotTesting

@testable import News

class NewsListViewModelTests: XCTestCase {
    
    private var viewModel: NewsListViewModel!
    private var parser: ArticleServiceParserType!
    private var service: ArticleServiceType!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        parser = MockArticleServiceParser()
        cancellables = []
    }
    
    override func tearDown() {
        parser = nil
        service = nil
        viewModel = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testGetArcicleService_Success_withExpectation() {
        service = MockArticleService(parser: parser,  jsonFileName: "MockArticles_Success")
        viewModel = NewsListViewModel(articleService: service)
        
        let expectation = XCTestExpectation(description: "Fetch articles successfully")
        
        viewModel.$state
            .sink { state in
                if case .success(let articles) = state {
                    XCTAssertEqual(articles.count, 3)
                    XCTAssertTrue(articles.first?.author == "Lidia Kelly")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.getArticles()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testGetArticleService_Failure_withExpectation() {
        service = MockArticleService(parser: parser,  jsonFileName: "MockArticles_Failure")
        viewModel = NewsListViewModel(articleService: service)
        
        let expectation = XCTestExpectation(description: "Fetch articles failed")
        
        viewModel.$state
            .sink { state in
                if case .failed(let error) = state {
                    XCTAssertTrue(error is NetworkError)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.getArticles()
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testGetArticleService_Success_Empty_Article_withExpectation() {
        service = MockArticleService(parser: parser,  jsonFileName: "MockArticles_Empty")
        viewModel = NewsListViewModel(articleService: service)
        
        let expectation = XCTestExpectation(description: "Fetch articles succeeded")
        
        viewModel.$state
            .sink { state in
                if case .success(let articles) = state {
                    XCTAssertEqual(articles.count, 0)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.getArticles()
        
        wait(for: [expectation], timeout: 3)
    }
    
//    func testInlineSnapshot_GetArcicleService_Success() {
//        service = MockArticleService(parser: parser,  jsonFileName: "MockArticles_Success")
//        viewModel = NewsListViewModel(articleService: service)
//                
//        viewModel.$state
//            .sink { state in
//                if case .success(let articles) = state {
//                    assertSnapshot(of: articles, as: .dump)
//                }
//            }
//            .store(in: &cancellables)
//        
//        viewModel.getArticles()        
//    }
}
