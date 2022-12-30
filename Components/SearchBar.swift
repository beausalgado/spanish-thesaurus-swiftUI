//
//  SearchBar.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? .red : .blue
                )

                .animation(.default, value: searchText)
            
            TextField("Search for a word", text: $searchText)
                .foregroundColor(.red)
                .disableAutocorrection(true)
                .overlay(
                Image(systemName: "xmark")
                    .padding(20)
                    .offset(x: 10)
                    .padding(.trailing, 10)
                    .foregroundColor(.purple)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .animation(.default, value: searchText)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    }
                ,alignment: .trailing
                )

            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.cyan).opacity(0.2)
                .shadow(
                    color: .black,
                    radius: 10, x: 0, y: 0)
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
        
    }
}
