//
//  Tabs.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct Tabs: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
    

        TabView(selection: $selectedTab){
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            Favorites()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)
            Search()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(2)

        }
    }
}
struct SouthTabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
