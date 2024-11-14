//
//  MockArticleServiceParser.swift
//  News
//
//  Created by Nitin George on 14/11/2024.
//

import Foundation
import Combine
import NetworkModule

public class MockArticleServiceParser: ArticleServiceParserType {
    
    public init() { }
    
    public func parse<T: Decodable>(data: Data, response: URLResponse, type: T.Type) -> AnyPublisher<T, Error> {
        
        return Just((data, response))
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw NetworkError.responseError
                }
                return data
            }
            .decode(type: T.self, decoder: createDecoder())
            .mapError { error -> Error in
                if let decodingError = error as? DecodingError {
                    return decodingError
                } else {
                    return NetworkError.unKnown
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func createDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
