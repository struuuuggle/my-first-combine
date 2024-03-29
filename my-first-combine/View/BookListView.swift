//
//  BookListView.swift
//  my-first-combine
//
//  Created by Mikiya Abe on 2019/11/20.
//  Copyright © 2019 struuuuggle. All rights reserved.
//

import SwiftUI
import Combine

struct BookListView: View {
    @ObservedObject var bookListVM = BookListViewModel()
    
    var body: some View {
        VStack {
            Button("Fetch book data!") {
                self.bookListVM.fetchBookList()
            }
            ForEach(bookListVM.books, id: \.id) { book in
                HStack {
                    Image(systemName: "book")
                    Text(book.title)
                }
            }
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
