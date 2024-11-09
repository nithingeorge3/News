//
//  ArticleServices.swift
//  News
//
//  Created by Nitin George on 10/11/2024.
//

import Combine
import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum EndPoint: String {
    case articles
    case details
}

extension EndPoint: APIBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .articles, .details:
            return URLRequest(url: baseURL.appendingPathComponent(self.path))
        }
    }
    
    var baseURL: URL {
        URL(filePath: "https://api.lil.software")
    }
    
    var path: String {
        switch self {
        case .articles:
            "/news"
        case .details:
            "/details"
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unKnown
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .responseError:
            "Response Error"
        case .unKnown:
            "Unknown Error"
        }
    }
}

protocol ArticleServiceType {
    func getArticles<T: Decodable>(endPoint: EndPoint, type: T.Type) -> Future<T, Error>
}

class ArticleService: ArticleServiceType {
    
    private var cancellables: Set<AnyCancellable> = []
    private let parser: ArticleServiceParserType
    
    init(parser: ArticleServiceParserType) {
        self.parser = parser
    }
    
    func getArticles<T: Decodable>(endPoint: EndPoint, type: T.Type) -> Future<T, Error> {
        
        return Future<T, Error> { [weak self] promise in
            guard let self = self else {
                return promise(.failure(NetworkError.unKnown))
            }
                        
            URLSession.shared.dataTaskPublisher(for: endPoint.urlRequest)
                .mapError { error -> Error in
                    return NetworkError.responseError
                }
                .flatMap { [weak self] output -> AnyPublisher<T, Error> in
                    guard let self = self else {
                        return Fail(error: NetworkError.unKnown).eraseToAnyPublisher()
                    }

                    return self.parser.parse(data: output.data, response: output.response, type: type)
                }
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        promise(.failure(error))
                    }
                }, receiveValue: { decodedData in
                    promise(.success(decodedData))
                })
                .store(in: &self.cancellables)
        }
    }
}


/*
 class ArticleService: ArticleServiceType {
     
     private var cancellables: Set<AnyCancellable> = []
     
     func getArticles<T: Decodable>(endPoint: EndPoint, type: T.Type) -> Future<T, Error> {
         
         return Future<T, Error> { [weak self] promise in
             
             guard let self = self else {
                 return promise(.failure(NetworkError.unKnown))
             }
             
             let jsonDecoder = JSONDecoder()
             jsonDecoder.dateDecodingStrategy = .iso8601
             
             print(endPoint.urlRequest)
             
             URLSession.shared.dataTaskPublisher(for: endPoint.urlRequest)
                 .tryMap { (data, response) -> Data in
                     guard let response = response as? HTTPURLResponse, 200 ... 299 ~=  response.statusCode else {
                         throw NetworkError.responseError
                     }
                     return data
                 }
                 .decode(type: T.self, decoder: jsonDecoder)
                 .receive(on: RunLoop.main)
                 .sink(receiveCompletion: { (completion) in
                     
                     if case let.failure(error) = completion {
                         switch error {
                         case let decodingError as DecodingError:
                             promise(.failure(decodingError))
                         case let apiError as NetworkError:
                             promise(.failure(apiError))
                         default:
                             promise(.failure(NetworkError.unKnown))
                         }
                     }
                 }, receiveValue: {
                     promise(.success($0)) })
                 .store(in: &self.cancellables)
         }
     }
 }

 */


