//
//  ListView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm : BookViewModel
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    if vm.books.isEmpty {
                        NoBookListView(
                            icon: "book",
                            title: "Nincs könyv hozzáadva",
                            description: "Add hozzá a kedvenc könyvedet a listához"
                        )
                        .listRowSeparator(.hidden)
                    } else {
                        ForEach(vm.books) { book in
                            NavigationLink(destination: DetailView(book: book)) {
                                ListRowView(book: book)
                            }
                            .buttonStyle(.plain)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        }
                        .onDelete(perform: vm.deleteBook)
                    }
                }
                .listStyle(.plain)
                
                // MARK: Navigating to the BookView screen
                NavigationLink(destination: AddBookView(vm: vm)) {
                    Text("Új könyv hozzáadása")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .glassEffect(.regular.interactive())
                .tint(.blue)
                .padding()
                
            }
            .navigationTitle("Kedvenc könyveim")
        }
        
    }
}

#Preview {
    ListView(vm: BookViewModel())
}
