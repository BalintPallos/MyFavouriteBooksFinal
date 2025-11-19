//
//  DetailView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

/**
 – Könyv címe
 – Szerző
 – Leírás
 – Borítókép
 */

struct DetailView: View {
    let book: Book
    
    var body: some View {
        
            ScrollView {
                VStack {
                    BookCoverView(urlString: book.coverUrl, width: 150, height: 200)
                        .shadow(color: .black.opacity(0.3), radius: 10)
                }
                
                VStack {
                    Text(book.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(book.author)
                        .font(.subheadline)
                        .fontWeight(.light)
                    Rectangle()
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                    
                    Text(book.description)
                        .font(.subheadline)
                        .padding()
                 
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray.opacity(0.3), radius: 10)
                .padding()
        }
    }
}

#Preview {
    DetailView(book: Book(
        title: "Harry Potter",
        author: "J.K Rowling",
        description: "Harry Potter J. K. Rowling hét kötetből álló, fantasy műfajú regénysorozata. Főhőse egy kamasz varázsló, Harry Potter, és az ő barátai, Ron Weasley és Hermione Granger, akik a Roxfort Boszorkány- és Varázslóképző Szakiskola tanulói. A történet arról szól, miként próbálja meg Harry legyőzni a gonosz varázslót, Voldemort Nagyurat, aki megölte Harry szüleit és megpróbálja meghódítani a varázslóvilágot, s leigázni a varázstalan embereket, a muglikat. A könyv-sorozatból számos film, videójáték és más termék is készült.",
        coverUrl: "https://picsum.photos/200",
        isPolidrome: false
    ))
}
