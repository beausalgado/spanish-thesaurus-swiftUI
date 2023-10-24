//
//  SearchTab.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI


struct SearchTab: View {
    @EnvironmentObject var vm: EntryDataService
    @EnvironmentObject var coredata: CoreData
    @State var searchText: String = ""
    @State var showAutocomplete: Bool = false
    @State var showResult: Bool = false
    @State var showRecents: Bool = true
    @State var stillShowResult: Bool = false
    @FocusState var isFocused: Bool
    @State var lastline = false
    var body: some View {
        VStack (spacing:0) {
            
            SearchBar(searchText: $searchText, isFocused: $isFocused, showAutocomplete: $showAutocomplete, showResult: $showResult, stillShowResult: $stillShowResult)
            
            ScrollView {
                VStack {
                    
                    if searchText.isEmpty  {
                        recentlysearched.padding([.top])
                    }
                    
                    if showAutocomplete && !searchText.isEmpty {
                        autocompleteresults.padding([.top])
                    }
                    
                    if showResult {
                        result.padding([.top])
                    }
                    
                    
    
        
                }.padding([.leading, .trailing], 30)
            }
                
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchTab()
            .environmentObject(dev.wordVM)
            .environmentObject(dev.coredata)
    }
}

extension SearchTab {
    
    private var result: some View {
        VStack {
            
            if vm.isLoading {
                ProgressView()
            } else {
                
                if let filterVM = vm.words.first(where: { $0.entry.lowercased() == searchText.lowercased() }) {
                    ZStack {
                        EntryRow(data: filterVM)
                    }.onAppear {
                        stillShowResult = false
                    }
                    
                }
                
                else
                    
                {
                    ErrorPage()
                
                }
                
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
                    
                    if vm.isLastItem(entry) {
                        AutocompleteResults(data: entry, lastline: true)
                            .onTapGesture {
                                searchText = entry.entry
                                showAutocomplete = false
                                isFocused = false
                                stillShowResult = true
                                showResult = true
                                if (!coredata.isInHistory(text: searchText)){
                                    coredata.addHistory(text: entry.entry)
                                }
                                
                            }
                    } else {
                        AutocompleteResults(data: entry, lastline: false)
                            .onTapGesture {
                                searchText = entry.entry
                                showAutocomplete = false
                                isFocused = false
                                stillShowResult = true
                                showResult = true
                                if (!coredata.isInHistory(text: searchText)){
                                    coredata.addHistory(text: entry.entry)
                                }
                                
                            }
                    }
                    
                }
            }
            
        }
    }
    
}

extension SearchTab {

      private var recentlysearched: some View {
            
            
            VStack {
                
                HStack {
                    Text("Recientes")
                        .font(.custom("Nunito", size: 24, relativeTo: .headline))
                        .fontWeight(.bold)
                        .frame(maxWidth:.infinity,
                               alignment:.leading)
                    Spacer()
                    
                    if !coredata.showAll {
                        Button(action: {
                            coredata.showAll = true
                            coredata.fetchHistory()
                        }) {
                            Text("Ver todos")
                                .font(.custom("Nunito", size: 16, relativeTo: .headline))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("gray"))
                        }}

                    
                }
                    .padding([.bottom], 15)
                
                
                ForEach(coredata.savedHistory, id: \.self){ entity in
                    
                    HStack(spacing:0) {
                        HStack {
                            Text(entity.entry ?? "")
                                .font(.custom("Nunito", size: 16, relativeTo: .body))
                                .fontWeight(.bold)
                            Spacer()
                            
                        }
                        .background(Color.white.opacity(0.001))
                        .onTapGesture {
                            searchText = entity.entry ?? ""
                            showAutocomplete = false
                            isFocused = false
                            stillShowResult = true
                            showResult = true

                        }
                        Xmark(entry: entity.entry ?? "", vm: _coredata)
                        
                    }
                    if !coredata.isLastHistory(entity) {
                        Divider()
                            .overlay(Color("divider"))
                            .padding([.top, .bottom], 5)
                        
                    }
                }
            }

        }
        
    }
    

