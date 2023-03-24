//
//  SearchResults.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/22/23.
//

import SwiftUI

struct SearchResults: View {
    @State var searchText: String = ""
    @State var searchFocused: Bool = false
    @State var isEditing: Bool = false
    @StateObject private var vm: test1ViewModel
    init (string1: String) {
        _vm = StateObject(wrappedValue: test1ViewModel(string1: string1))
    }
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    results
                    Spacer(minLength: 0)
                }.padding([.leading, .trailing], 30)
                    .padding([.top])
                
                
            
            }
    }
    
    
    
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(string1: "abad")
    }
}

extension SearchResults {
    
    private var results: some View {
        VStack {
            ForEach(vm.test1) { entry in
                EntryRowView(data: entry)
            }
           
        }
    }
}

