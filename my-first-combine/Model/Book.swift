//
//  Book.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/20.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

struct Book: Hashable, Decodable {
    let id: Int64
    let title: String
}
