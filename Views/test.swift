//
//  test.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var searchText: String
    @FocusState.Binding var focused: Bool

       var body: some View {
           HStack {
               Image(systemName: "magnifyingglass")
               TextField("Search", text: $searchText)
                   .foregroundColor(.primary)
                   .focused($focused)

               if !searchText.isEmpty {
                   Button(action: {
                       searchText = ""
                   }) {
                       Image(systemName: "xmark.circle.fill")
                           .foregroundColor(.primary)
                   }
               }
               
         //      Text("focused: \(focused.description)")
               
           }
           .padding(.horizontal)
           .frame(height: 48)
           .background(Color(.secondarySystemBackground))
           .cornerRadius(12)
       }
    
}
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(searchText: .constant(""))
//    }
//}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
