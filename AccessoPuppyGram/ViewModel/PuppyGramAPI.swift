//
//  PuppyGramAPI.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/26/22.
//

import Foundation
import Combine

enum PuppyGram {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.flickr.com/services/feeds")!
}

enum APIPath: String {
    case photos_public = "photos_public.gne"
}

extension PuppyGram {
    
    static func get(_ path: APIPath) -> AnyPublisher<PuppyGramElement, Error> {
        
        var components = URLComponents(string: baseUrl.appendingPathComponent(path.rawValue).absoluteString) ?? URLComponents()
        components.queryItems = [
            URLQueryItem(name: "tags", value: "puppy"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
        ]

        let request = URLRequest(url: components.url!)
        return apiClient.run(request)
                    .map(\.value)
                    .eraseToAnyPublisher()
    }
}
