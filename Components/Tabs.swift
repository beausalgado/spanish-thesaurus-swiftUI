//
//  Tabs.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "lizard")
                    Text("Home")
                }
            Text("History")
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
            Text("Favorites")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

        }
    }
}
struct SouthTabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
