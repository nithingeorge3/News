//
//  ArticleServiceImpl.swift
//  NetworkModule
//
//  Created by Nitin George on 14/11/2024.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case invalidURL
    case responseError
    case unKnown
}

public protocol ArticleServiceParserType {
    func parse<T: Decodable>(data: Data, response: URLResponse, type: T.Type) -> AnyPublisher<T, Error>
}

public protocol ArticleServiceType {
    func getArticles<T: Decodable>(endPoint: EndPoint, type: T.Type) -> Future<T, Error>
}
