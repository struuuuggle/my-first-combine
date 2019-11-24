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
    
    @Published var books: [Book] = []
    var cancellables: Set<AnyCancellable> = []
    
    func fetchBookList() {
        let request = BookListRequest()
        NetworkPublisher.publish(request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: debugPrint("Finished fechting")
                case .failure(let e): debugPrint("Fetching failure", e)
                }
            }, receiveValue: { value in
                // in case the request succeeds
                debugPrint("response: ", value)
                self.books = value
            }).store(in: &cancellables)
    }
}
