//
//  Book.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//
import SwiftUI

struct Book : Codable, Identifiable {
    var id: UUID
    let title : String
    let author : String
    let description : String
    let coverUrl : String
    var isPolidrome: Bool = false
    
    init(title: String, author: String, description: String, coverUrl: String, isPolidrome: Bool) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.description = description
        self.coverUrl = coverUrl
        self.isPolidrome = isPolidrome
    }
    
}
