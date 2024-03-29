//
//  Tabs.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct Tabs: View {
    
    @EnvironmentObject var vm: CoreData
    @State var selectedTab: Int = 0
    @State var clicked = true
    
    var body: some View {
    

        TabView(selection: $selectedTab){
            HomeTab()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            FavoritesTab()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)

            SearchTab()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(2)

        }.accentColor(.black)
            .animation(.easeOut(duration: 0.2), value: selectedTab)

    }
}
struct SouthTabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
            .environmentObject(dev.wordVM)
            .environmentObject(dev.coredata)
    }
}
