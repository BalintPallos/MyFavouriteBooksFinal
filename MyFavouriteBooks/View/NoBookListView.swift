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
                ZStack {
                    Circle()
                        .fill(.blue.gradient)
                        .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
                        .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
                        .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
                        .frame(width: 200)
                        .padding(.vertical, 50)
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.white)
                }
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
