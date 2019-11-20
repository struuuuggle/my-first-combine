//
//  Constants.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/20.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation

enum Constants {
    case bookList
    
    static var path: String {
        switch self {
        case .bookList: return "zcdta"
        }
    }
    
    static var baseURL: URL {
        let requestURL = "https://api.myjson.com/bins".asURL!
        debugPrint("[INFO] url: \(requestURL)")
        return requestURL
    }
    
    static var header: [String: String]? {
        return nil
    }
}
