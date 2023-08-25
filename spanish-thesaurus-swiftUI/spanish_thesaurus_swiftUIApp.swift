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
    var body: some Scene {

        WindowGroup {

                Index().environmentObject(vm)


        }

//        WindowGroup {
//            SearchTab().environmentObject(vm)
//        }
//        WindowGroup {
//            CoreDataTest1()
//        }
    }
}
