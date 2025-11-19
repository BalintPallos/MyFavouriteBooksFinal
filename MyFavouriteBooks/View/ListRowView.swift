//
//  ListRowView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

struct ListRowView: View {
    
    let book: Book
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 14) {
             
             // MARK: Cover Image
             BookCoverView(urlString: book.coverUrl, width: 50, height: 70)
                 .padding(.leading, 20)
             
             // MARK: Splitter
             Rectangle()
                 .fill(.gray.opacity(0.2))
                 .frame(width: 2, height: 60)
                 .padding(.vertical, 10)
             
             // MARK: Title
             Text(book.title)
                 .font(.headline)
                 .fontWeight(.semibold)
                 .foregroundStyle(.primary)
                 .underline(book.isPolidrome)
                 .lineLimit(2)
                 .truncationMode(.tail)
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding(.leading, 25)
                 .padding(.trailing, 5)
         }
         .frame(height: 80)
         .frame(maxWidth: .infinity)
         .background(Material.ultraThin)
         .clipShape(RoundedRectangle(cornerRadius: 10))
         .shadow(color: .gray.opacity(0.3), radius: 10)
         .padding(.horizontal, 10)
         .padding(.vertical, 4)
     }
 }

#Preview {
    ListRowView(book: Book(
        title: "Anna a háborúban",
        author: "Kiss Endre",
        description: "Ez a könyv leírása.",
        coverUrl: "https://picsum.photos/200",
        isPolidrome: true
    ))
    .environmentObject(BookViewModel())
}
