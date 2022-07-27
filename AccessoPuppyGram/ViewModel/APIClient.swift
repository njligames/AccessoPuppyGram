//
//  APIClient.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/26/22.
//

import Foundation
import Combine

struct APIClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                
                let decoder = JSONDecoder()
                if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
                    decoder.dateDecodingStrategy = .iso8601
                }
            
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

