//
//  MyFavouriteBooksApp.swift
//  MyFavouriteBooks
//
//  Created by Balint Pallos on 2025. 11. 15..
//

import SwiftUI

@main
struct MyFavouriteBooksApp: App {
    @StateObject private var vm = BookViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(vm)
        }
    }
}
