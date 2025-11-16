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
        if let url = URL(string:  urlString) {
            AsyncImage(url: url) { phases in
                switch phases {
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

                    
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: height)
                        .cornerRadius(10)
                        .foregroundStyle(.gray)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    BookCoverView(
        urlString: "ht",
        width: 60,
        height: 90
    )
}
