//
//  BookListRequest.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/21.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation

enum BookListRequest: BaseRequestProtocol {
    typealias ResponseType = BookListResponse
    
    case get
    
    var path: String {
        return Constants.bookList.path
    }
    
    var asURLRequest: URLRequest {
        let requestURL = baseURL.appendingPathComponent(path)
        let urlRequest = URLRequest(url: requestURL)
        return urlRequest
    }
}
