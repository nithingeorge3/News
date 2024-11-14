//
//  MockArticleServiceTests.swift
//  News
//
//  Created by Nitin George on 12/11/2024.
//

import XCTest
import Combine
import NetworkModule

@testable import News

final class MockArticleService: ArticleServiceType {
    
    private let parser: ArticleServiceParserType
    private var cancellables: Set<AnyCancellable> = []
    private let jsonFileName: String
    
    init(parser: ArticleServiceParserType, jsonFileName: String) {
        self.parser = parser
        self.jsonFileName = jsonFileName
    }
    
    func getArticles<T: Decodable>(endPoint: EndPoint, type: T.Type) -> Future<T, Error> {
        
        return Future<T, Error> {  [weak self] promise in
            
            guard let self = self else {
                return promise(.failure(NetworkError.unKnown))
            }
            
            guard let url = Bundle(for: MockArticleService.self).url(forResource: jsonFileName, withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                return promise(.failure(NetworkError.responseError))
            }

            guard let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
                return promise(.failure(NetworkError.responseError))
            }
            
            self.parser.parse(data: data, response: response, type: type)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    }
                }, receiveValue: { decodedData in
                    promise(.success(decodedData))
                })
                .store(in: &cancellables)
        }
    }
}
