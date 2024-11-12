//
//  NewsImageView.swift
//  News
//
//  Created by Nitin George on 09/11/2024.
//

import SwiftUI
import Kingfisher

struct NewsImageView: View {
    let imageURL: URL
    let imageFrame: (CGFloat?, CGFloat?)
    var kingfisherManager: KingfisherManager = .shared // Dependency injection for testing

    @State private var retryAttempts = 0
    @State private var maxRetryAttempts = 3
    @State private var isLoadingSuccessful = false
    @State private var currentImageURL: URL // URL used for loading

    init(imageURL: URL,
         imageFrame: (CGFloat?, CGFloat?) = (width: 200, height: 200),
         kingfisherManager: KingfisherManager = .shared)
    {
        self.imageURL = imageURL
        self.imageFrame = imageFrame
        self.kingfisherManager = kingfisherManager
        _currentImageURL = State(initialValue: imageURL)
    }

    var body: some View {
        VStack {
            KFImage(currentImageURL)
                .placeholder {
                    ProgressView("Loading...")
                }
                .onSuccess { result in
                    isLoadingSuccessful = true
                }
                .onFailure { _ in
                    if retryAttempts < maxRetryAttempts {
                        retryAttempts += 1
                        reloadImage()
                    }
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageFrame.0, height: imageFrame.1)
                .clipped()
        }
    }

    private func reloadImage() {
        kingfisherManager.cache.removeImage(forKey: imageURL.absoluteString)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            currentImageURL = imageURL
        }
    }
}

/*
 protocol ImageLoader {
     func retrieveImage(
         with resource: Resource,
         options: KingfisherOptionsInfo?,
         progressBlock: DownloadProgressBlock?,
         completionHandler: ((@Sendable (Result<RetrieveImageResult, KingfisherError>) -> Void)?) // Apply @Sendable here
     ) -> DownloadTask?
 }

 class ImageLoaderWrapper: ImageLoader {
     private let kingfisherManager: KingfisherManager

     init(manager: KingfisherManager = .shared) {
         self.kingfisherManager = manager
     }

     func retrieveImage(
         with resource: Resource,
         options: KingfisherOptionsInfo?,
         progressBlock: DownloadProgressBlock?,
         completionHandler: ((@Sendable (Result<RetrieveImageResult, KingfisherError>) -> Void)?)
     ) -> DownloadTask? {
         return kingfisherManager.retrieveImage(
             with: resource,
             options: options,
             progressBlock: progressBlock,
             completionHandler: completionHandler
         )
     }
 }

 struct AdvancedImageView: View {
     let imageURL: URL
     var imageLoader: ImageLoader // Use the protocol type
     
     @State var retryAttempts = 0
     @State var maxRetryAttempts = 3
     @State var isLoadingSuccessful = false
     @State var currentImageURL: URL
     
     init(imageURL: URL, imageLoader: ImageLoader = ImageLoaderWrapper()) {
         self.imageURL = imageURL
         self.imageLoader = imageLoader
         _currentImageURL = State(initialValue: imageURL)
     }
     
     var body: some View {
         VStack {
             KFImage(currentImageURL)
                 .placeholder {
                     ProgressView("Loading...")
                 }
                 .onSuccess { result in
                     isLoadingSuccessful = true
                 }
                 .onFailure { _ in
                     if retryAttempts < maxRetryAttempts {
                         retryAttempts += 1
                         reloadImage()
                     }
                 }
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 200, height: 200)
                 .clipped()
                 .overlay(
                     Image(systemName: "checkmark.circle.fill")
                         .foregroundColor(.green)
                         .opacity(isLoadingSuccessful ? 1 : 0)
                         .padding()
                         .background(Color.white.opacity(0.6))
                         .clipShape(Circle())
                         .padding(.top, 8)
                         .padding(.trailing, 8),
                     alignment: .topTrailing
                 )
         }
     }
     
     private func reloadImage() {
         _ = imageLoader.retrieveImage(
             with: KF.ImageResource(downloadURL: imageURL),
             options: nil,
             progressBlock: nil
         ) { result in
             if case .success = result {
                 // Update on the main actor using Swift concurrency
                 Task { @MainActor in
                     isLoadingSuccessful = true
                 }
             }
         }
     }
 }
 */

/*
 import XCTest
 import SwiftUI
 import Combine
 @testable import YourAppName

 // Mock ImageLoader for testing purposes
 class MockImageLoader: ImageLoader {
     var shouldFail: Bool = true
     var retrieveImageCallCount = 0

     func retrieveImage(
         with resource: Resource,
         options: KingfisherOptionsInfo?,
         progressBlock: DownloadProgressBlock?,
         completionHandler: @Sendable ((Result<RetrieveImageResult, KingfisherError>) -> Void)?
     ) -> DownloadTask? {
         retrieveImageCallCount += 1
         if shouldFail {
             completionHandler?(.failure(.cacheError(reason: .imageNotExisting)))
         } else {
             let image = KFCrossPlatformImage()
             let result = RetrieveImageResult(image: image, cacheType: .none, source: .network(resource))
             completionHandler?(.success(result))
         }
         return nil
     }
 }

 final class AdvancedImageViewTests: XCTestCase {
     var mockImageLoader: MockImageLoader!
     var view: AdvancedImageView!
     var cancellables: Set<AnyCancellable>!

     override func setUp() {
         super.setUp()
         mockImageLoader = MockImageLoader()
         cancellables = []
     }

     override func tearDown() {
         mockImageLoader = nil
         cancellables = nil
         super.tearDown()
     }

     func testImageLoadsSuccessfully() {
         // Given
         mockImageLoader.shouldFail = false
         view = AdvancedImageView(imageURL: URL(string: "https://example.com/image.jpg")!, imageLoader: mockImageLoader)
         let expectation = XCTestExpectation(description: "Image loads successfully")

         // When
         view.$isLoadingSuccessful
             .dropFirst() // Ignore the initial value
             .sink { isLoadingSuccessful in
                 // Then
                 XCTAssertTrue(isLoadingSuccessful, "isLoadingSuccessful should be true when the image loads successfully")
                 XCTAssertEqual(self.mockImageLoader.retrieveImageCallCount, 1, "Image should load only once")
                 expectation.fulfill()
             }
             .store(in: &cancellables)

         // Trigger the reload to simulate image loading
         view.reloadImage()

         wait(for: [expectation], timeout: 5.0)
     }

     func testRetryLogicOnFailure() {
         // Given
         mockImageLoader.shouldFail = true
         view = AdvancedImageView(imageURL: URL(string: "https://example.com/image.jpg")!, imageLoader: mockImageLoader)
         view.maxRetryAttempts = 3 // Set a small retry limit for testing
         let expectation = XCTestExpectation(description: "Retry logic works as expected")

         // When
         view.$retryAttempts
             .dropFirst() // Ignore the initial value
             .sink { retryAttempts in
                 // Check that the retry attempts increase as expected
                 if retryAttempts == 3 {
                     XCTAssertEqual(self.mockImageLoader.retrieveImageCallCount, 3, "Image should retry loading up to the max retry limit")
                     XCTAssertFalse(self.view.isLoadingSuccessful, "isLoadingSuccessful should be false when retries fail")
                     expectation.fulfill()
                 }
             }
             .store(in: &cancellables)

         // Trigger the reload to simulate image loading
         view.reloadImage()

         wait(for: [expectation], timeout: 5.0)
     }

     func testMaxRetryLimit() {
         // Given
         mockImageLoader.shouldFail = true
         view = AdvancedImageView(imageURL: URL(string: "https://example.com/image.jpg")!, imageLoader: mockImageLoader)
         view.maxRetryAttempts = 2 // Limit retries to 2 for testing
         let expectation = XCTestExpectation(description: "Max retry limit is respected")

         // When
         view.$retryAttempts
             .dropFirst()
             .sink { retryAttempts in
                 if retryAttempts == 2 {
                     XCTAssertEqual(self.mockImageLoader.retrieveImageCallCount, 2, "Image should not retry beyond max retry limit")
                     XCTAssertFalse(self.view.isLoadingSuccessful, "isLoadingSuccessful should remain false after max retries are reached")
                     expectation.fulfill()
                 }
             }
             .store(in: &cancellables)

         // Trigger the reload to simulate image loading
         view.reloadImage()

         wait(for: [expectation], timeout: 5.0)
     }
 }
 */
