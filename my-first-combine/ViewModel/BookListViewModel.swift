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
    @Published var books: [BookListResponse] = .init()
    
    var cancellables: Set<AnyCancellable> = []
//    init() {
//        URLSession.shared.dataTask(with: BookListRequest.get.asURLRequest) { (data, response, error) in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.books = try! JSONDecoder().decode([BookListResponse].self, from: data)
//            }
//        }.resume()
//    }
    
    init() {
        NetworkPublisher.publish(BookListRequest.get)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: print("finished")
                case .failure(let e): print("failure", e) // failure
                }
            }, receiveValue: { value in
                print("receiveValue", value) // success
            }).store(in: &cancellables)
    }
}
