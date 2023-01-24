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

            HStack {
                Image("brontosaurus")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
                    .opacity(0.6)
                SearchBar(searchText: $searchText)
                   
                Image(systemName: "line.3.horizontal")


        }
            Spacer(minLength: 0)
            
            }
            
        
 
         
        
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
  
    }
}
