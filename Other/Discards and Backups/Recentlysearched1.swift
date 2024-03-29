//
//  Recentlysearched1.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/18/23.
//

//
//  SearchTab.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//
//
//import SwiftUI
//
//
//struct SearchTab: View {
//    @EnvironmentObject var vm: EntryDataService
//    @EnvironmentObject var coredata: CoreDataHistory
//    @State var searchText: String = ""
//    @State var showAutocomplete: Bool = false
//    @State var showResult: Bool = false
//    @State var showRecents: Bool = true
//    @State var stillShowResult: Bool = false
//    @FocusState var isFocused: Bool
//    @State var lastline = false
//    var body: some View {
//        VStack (spacing:0) {
//            
//            SearchBar(searchText: $searchText, isFocused: $isFocused, showAutocomplete: $showAutocomplete, showResult: $showResult, stillShowResult: $stillShowResult)
//            
//            ScrollView {
//                
//                if searchText.isEmpty  {
//                    RecentlySearched().padding([.top])
//                }
//                
//                if showAutocomplete && !searchText.isEmpty {
//                    autocompleteresults.padding([.top])
//                }
//                
//                if showResult {
//                    result.padding([.top])
//                }
//                
//              //  Spacer()
//            
//                
//   //             Group {
//     //               Text(searchText)
////
////                    Text("showAutocomplete: \(showAutocomplete.description)")
////                    Text("showResult: \(showResult.description)")
////                    Text("isFocused: \(isFocused.description)")
////                    Text("tapped: \(stillShowResult.description)")
////                    Text("vm: \(vm.words.count)")
////                    Text("vm: \(vm.words.description)")
//                 
//                  
//     //           }
//            }.padding([.leading, .trailing], 30)
//                
//        }
//    }
//}
//
//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchTab()
//            .environmentObject(dev.wordVM)
//            .environmentObject(dev.cdHistory)
//            .environmentObject(dev.cdFavorites)
//    }
//}
//
//extension SearchTab {
//    
//    private var result: some View {
//        VStack {
//            
//            if let filterVM = vm.words.first(where: { $0.entry.lowercased() == searchText.lowercased() }) {
//                ZStack {
//                    EntryRow(data: filterVM)
//                }.onAppear {
//                    stillShowResult = false
//                }
//                
//            } else {
//                Spacer()
//                ProgressView()
//                    .padding(100)
//                   
//            }
//        }
//    }
//}
//
//extension SearchTab {
//    private var autocompleteresults: some View {
//        
//        VStack {
//            
//            if vm.isLoading {
//                ProgressView()
//            } else {
//                ForEach(vm.words, id:\.self) { entry in
//                    
//                    if vm.isLastItem(entry) {
//                        AutocompleteResults(data: entry, lastline: true)
//                            .onTapGesture {
//                                searchText = entry.entry
//                                showAutocomplete = false
//                                isFocused = false
//                                stillShowResult = true
//                                showResult = true
//                                if (!coredata.isInHistory(text: searchText)){
//                                    coredata.addHistory(text: entry.entry)
//                                }
//
//                            }
//                    } else {
//                        AutocompleteResults(data: entry, lastline: false)
//                            .onTapGesture {
//                                searchText = entry.entry
//                                showAutocomplete = false
//                                isFocused = false
//                                stillShowResult = true
//                                showResult = true
//                                if (!coredata.isInHistory(text: searchText)){
//                                    coredata.addHistory(text: entry.entry)
//                                }
//
//                            }
//                    }
//           
//                }
//            }
//
//        }
//    }
//    
//
//
//    
//    
//    
//    
//}
//
//
//
