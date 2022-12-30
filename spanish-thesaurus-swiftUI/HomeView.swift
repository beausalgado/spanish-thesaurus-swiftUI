//
//  ContentView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    var body: some View {

        VStack {
            
        
            SearchBar(searchText: $searchText)
                

                Image(systemName: "globe")
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            Tabs()

        }
            
        
 
         
        
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
  
    }
}
