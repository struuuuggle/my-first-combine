//
//  BaseRequestProtocol.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/21.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation

protocol BaseRequestProtocol {
    associatedtype ResponseType
    
    var baseURL: URL { get }
    var path: String { get }
}

extension BaseRequestProtocol {
    var baseURL: URL {
        return Constants.baseURL
    }
    var asURLRequest: URLRequest {
        return URLRequest(url: baseURL.appendingPathComponent(path))
    }
}
