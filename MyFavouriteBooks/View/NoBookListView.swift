//
//  NoBookListView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 16..
//

import SwiftUI

struct NoBookListView: View {
    var icon : String
    var title : String
    var description : String
    
    var body: some View {
        ContentUnavailableView {
            Label {
                Text(title)
                    .font(.title2)
            } icon: {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
            }
        } description: {
            Text(description)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    NoBookListView(
        icon: "book",
        title: "Nincs könyv hozzáadva",
        description: "Add hozzá a kedvenc könyvedet a listához")
        
}
