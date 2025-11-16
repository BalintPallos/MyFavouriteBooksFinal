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
        
        HStack (alignment: .center, spacing: 14) {
            // MARK: Cover Image
            BookCoverView(urlString: book.coverUrl, width: 50, height: 70)
                .padding(.leading, 20)
            
            // MARK: Splitter and title
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(width: 2)
                .padding()
            
            Spacer()
            VStack {
                Text(book.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .underline(book.isPolidrome)
                    .padding(.horizontal)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }

            Spacer()
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
        title: "Anna nagy napja",
        author: "Példa Szerző",
        description: "Ez egy példa könyv leírása.",
        coverUrl: "https://picsum.photos/200",
        isPolidrome: true
    ))
}
