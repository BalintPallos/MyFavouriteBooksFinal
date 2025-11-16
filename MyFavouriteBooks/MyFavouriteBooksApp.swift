//
//  MyFavouriteBooksApp.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

@main
struct MyFavouriteBooksApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = BookViewModel()
            ListView(vm: vm)
        }
    }
}
