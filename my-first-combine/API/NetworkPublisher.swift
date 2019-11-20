//
//  NetworkPublisher.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/21.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation
import Combine

struct NetworkPublisher {
    private static let retryCount: Int = 1
    private static let decoder = JSONDecoder()
    
    static func publish<T, V>(_ request: T) -> AnyPublisher<V, Error>
        where T: BaseRequestProtocol, V: Decodable, T.ResponseType == V {
        return URLSession.shared
            .dataTaskPublisher(for: request.asURLRequest)
            .retry(retryCount)
            .map { $0.data }
            .decode(type: V.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
