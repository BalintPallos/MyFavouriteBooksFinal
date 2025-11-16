//
//  AddBookView.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 16..
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var vm: BookViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var title : String = ""
    @State var author: String = ""
    @State var description : String = ""
    @State var coverUrl: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom) {
                Form {
                    Section(header: Text("Könvy adatai")) {
                        TextField("Cím", text: $title)
                        .textInputAutocapitalization(.sentences)
                        
                        TextField("Szerő", text: $author)
                            .textInputAutocapitalization(.sentences)
                        
                        TextField("Leírás", text: $description)
                            .textInputAutocapitalization(.sentences)
                        TextField("Kép URL", text: $coverUrl)
                    }
                }
                .navigationTitle("Könyv hozzáadása")
                
                    Button {
                        let newBook = Book(
                            title: title,
                            author: author,
                            description: description,
                            coverUrl: coverUrl,
                            isPolidrome: vm.checkIfPolidrome(for: Book(title: title, author: author, description: description, coverUrl: coverUrl, isPolidrome: false)))
                        vm.addBook(book: newBook)
                        dismiss()
                        
                    } label: {
                        Text("Mentés")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .fontWeight(.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .glassEffect(.regular.interactive())
                        .tint(.blue)
                        .padding()
                        .disabled(!canBeSaved())
                
            }
        }
    }
    
    func canBeSaved() -> Bool {
        return title.count > 1 && author.count > 1 &&
        description.count > 1 && coverUrl.count > 1
    }
}
 
#Preview {
    let vm = BookViewModel()
     AddBookView(vm: vm)
}
