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
    
    var path: String {
        switch self {
        case .bookList: return "/zcdta"
        }
    }
    
    static var baseURL: URL {
        return "https://api.myjson.com/bins".asURL!
    }
    static var header: [String: String]? {
        return nil
    }
}
