//
//  String+.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/21.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation

extension String {
    public var asURL: URL? {
        return URL(string: self)
    }
}
