//
//  Favorites.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/9/23.
//

import SwiftUI

struct Favorites: View {
    @EnvironmentObject private var vm:HomeViewModel
    var body: some View {
        VStack {
            List {
                ForEach(vm.allEntries) { entry in
                    EntryRowView(entry: entry)
                }
            }.listStyle(PlainListStyle())
        }
    }

}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Favorites()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
