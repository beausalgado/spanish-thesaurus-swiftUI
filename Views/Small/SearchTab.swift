//
//  SearchTab.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI


struct SearchTab: View {
    @EnvironmentObject var vm: EntryDataService
    @State var searchText: String = ""
    @State var showAutocomplete: Bool = false
    @State var showResult: Bool = false
    @State var showRecents: Bool = true
    @State var stillShowResult: Bool = false
    @FocusState var isFocused: Bool
    var body: some View {
        VStack (spacing:0) {
            
            SearchBar(searchText: $searchText, isFocused: $isFocused, showAutocomplete: $showAutocomplete, showResult: $showResult, stillShowResult: $stillShowResult)
            
            ScrollView {
                
                if searchText.isEmpty  {
                    RecentlySearched()
                }
                
                if showAutocomplete && !searchText.isEmpty {
                    autocompleteresults
                }
                
                if showResult {
                    result
                }
                
                Spacer()
                
//                Group {
//
//                    Text("showAutocomplete: \(showAutocomplete.description)")
//                    Text("showResult: \(showResult.description)")
//                    Text("isFocused: \(isFocused.description)")
//                    Text("tapped: \(stillShowResult.description)")
//                    Text("vm: \(vm.words.description)")
//                }
            }.padding([.leading, .trailing], 30).padding([.top])
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchTab().environmentObject(dev.wordVM)
    }
}

extension SearchTab {
    
    private var result: some View {
        VStack {
            
            if let filterVM = vm.words.first(where: { $0.entry == searchText.lowercased()}) {
                ZStack {
                    EntryRow(data: filterVM)
                }.onAppear {
                    stillShowResult = false
                }
                
            } else {
                ProgressView()
            }
        }
    }
}

extension SearchTab {
    private var autocompleteresults: some View {
        
        VStack {
            
            if vm.isLoading {
                ProgressView()
            } else {
                ForEach(vm.words, id:\.self) { entry in
                    AutocompleteResults(data: entry)
                        .onTapGesture {
                            searchText = entry.entry
                            showAutocomplete = false
                            isFocused = false
                            stillShowResult = true
                            showResult = true
                        }
                }
            }

        }
    }
    
}


