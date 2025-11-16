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
    
    func deleteBook(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
        saveBooks()
    }
        
        // MARK: Cheking if the title contains a polidrome word
        func checkIfPolidrome(for book: Book) -> Bool {
            let words = book.title.lowercased().components(separatedBy:  " ")
            return words.contains { word in
                word == String(word.reversed()) && word.count > 1
            
        }
    }
}
