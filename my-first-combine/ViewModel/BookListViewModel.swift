//
//  BookListViewModel.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/20.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import Foundation
import Combine

class BookListViewModel: ObservableObject {
    typealias Book = BookListResponse
    
    @Published var books: [Book] = .init()
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        let request = BookListRequest()
        NetworkPublisher.publish(request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: print("finished")
                case .failure(let e): print("failure", e) // failure
                }
            }, receiveValue: { value in
                print("response: ", value) // success
                self.books = value
            }).store(in: &cancellables)
    }
}
