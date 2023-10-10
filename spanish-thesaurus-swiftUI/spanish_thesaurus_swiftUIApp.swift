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
    @StateObject private var coredataVM = CoreDataFavorites()
    var body: some Scene {

//        WindowGroup {
//
//                Index()
//                .environmentObject(vm)
//                .environmentObject(coredataVM)
//
//
//        }
        
        

//        WindowGroup {
//            SearchTab().environmentObject(vm)
//        }
        WindowGroup {
            FavoritesList()
        }
    }
}
