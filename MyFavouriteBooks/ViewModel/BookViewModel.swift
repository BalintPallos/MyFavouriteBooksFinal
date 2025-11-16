//
//  BookViewModel.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI
internal import Combine
import Foundation

class BookViewModel : ObservableObject {
    @Published var books : [Book] = []
    
    init() {
        loadBooks()
        
        // this can be deleted after testing
        if books.isEmpty { // csak akkor adj hozzá példákat, ha nincs mentett adat
            books = [
                Book(title: "Anna nagy napja",
                     author: "Példa Szerző",
                     description: "Ez egy példa könyv leírása.",
                     coverUrl: "https://picsum.photos/200",
                     isPolidrome: true),
                Book(title: "Szerelem és kaland",
                     author: "Másik Szerző",
                     description: "Izgalmas kaland a természetben.",
                     coverUrl: "https://picsum.photos/201",
                     isPolidrome: false),
                Book(title: "Otto utazása",
                     author: "Tanuló Fejlesztő",
                     description: "Ismerkedés a SwiftUI világával.",
                     coverUrl: "https://picsum.photos/202",
                     isPolidrome: true)
            ]
            saveBooks()
        }
    }
        
        // MARK: Adding a book
        func addBook(book: Book) {
            var newBook = book
            newBook.isPolidrome = checkIfPolidrome(for: book)
            books.append(newBook)
            saveBooks()
        }
        
        // MARK: Saving books
        func saveBooks() {
            if let encodedBooks = try? JSONEncoder().encode(books){
                UserDefaults.standard.set(encodedBooks, forKey: "books")
            }
        }
        
        // MARK: Loading books
        func loadBooks() {
            if let data = UserDefaults.standard.data(forKey: "books"),
               let savedBooks = try? JSONDecoder().decode([Book].self, from: data) {
                books = savedBooks
            }
        }
        
        // MARK: Cheking if the title contains a polidrome word
        func checkIfPolidrome(for book: Book) -> Bool {
            let words = book.title.lowercased().components(separatedBy:  " ")
            return words.contains { word in
                word == String(word.reversed()) && word.count > 1
            
        }
    }
}
