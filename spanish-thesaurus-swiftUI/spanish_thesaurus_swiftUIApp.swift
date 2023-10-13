//
//  spanish_thesaurus_swiftUIApp.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

@main
struct spanish_thesaurus_swiftUIApp: App {
    @StateObject private var vm = EntryDataService()
    @StateObject private var cdFavorites = CoreDataFavorites()
    @StateObject private var cdHistory = CoreDataHistory()
    var body: some Scene {

        WindowGroup {

                Index()
                .environmentObject(vm)
                .environmentObject(cdFavorites)
                .environmentObject(cdHistory)


        }
        
        

//        WindowGroup {
//            SearchTab().environmentObject(vm)
//        }
//        WindowGroup {
//            FavoritesList()
//        }
    }
}
