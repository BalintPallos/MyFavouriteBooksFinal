//
//  BookCoverView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

struct BookCoverView: View {
    let urlString : String
    let width : CGFloat
    let height : CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                Image(systemName: "book")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(10)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(10)
                
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .foregroundStyle(.gray)
                    .cornerRadius(10)
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    BookCoverView(
        urlString: "https://picsum.photos/200",
        width: 60,
        height: 90
    )
}
