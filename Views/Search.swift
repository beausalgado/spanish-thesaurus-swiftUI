//
//  Search.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI


struct Search: View {
    @StateObject var vm: EntryDataService
    @State var searchText: String = ""
    @State var showAutocomplete: Bool = false
    @State var showResult: Bool = false
    @State var showRecents: Bool = true
    @State var stillShowResult: Bool = false
    @FocusState var isFocused: Bool
    var body: some View {
        VStack (spacing:0) {
            
            searchbar.padding(.horizontal, 30)
                .padding([.bottom], 1)
            Divider()
                .frame(height: 0.1)
                .background(Color("strokeSearch"))
                .padding([.top, .bottom], 5)
            ScrollView {
                if searchText == ""  {
                    recentSearches()
                }
                if showAutocomplete && searchText != "" {
                    autocompleteresults
                }
                if showResult {
                    result
                }
                Spacer()
//                Group {
//
//                    Text("isEditing: \(isEditing.description)")
//                    Text("showAutocomplete: \(showAutocomplete.description)")
//                    Text("showResult: \(showResult.description)")
//                    Text("isFocused: \(isFocused.description)")
//                    Text("tapped: \(stillShowResult.description)")
//
//                }
            }.padding([.leading, .trailing], 30).padding([.top])
        }.padding(.top, 25)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(vm: dev.wordVM1)
    }
}

extension Search {
    
    private var result: some View {
        VStack {
            
            if let filterVM = vm.words.first(where: { $0.entry == searchText.lowercased()}) {
                ZStack {
                    EntryRowView(data: filterVM)
                }.onAppear {
                    stillShowResult = false
                }
                
            } else {
                ProgressView()
            }
        }
    }
}

extension Search {
    private var autocompleteresults: some View {
        VStack {
            ForEach(vm.words, id:\.self) { entry in
                autocompleteResults(data: entry)
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

extension Search {
    
    private var searchbar: some View {
        HStack {
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(
                        searchText.isEmpty ? .black.opacity(0.3) : .black.opacity(0.8)
                    )
                
                    .animation(.default, value: searchText)
                
                TextField("Buscar", text: $searchText, onCommit: {
                    //    withAnimation {
                    showAutocomplete = false
                    showResult = true
                    //   }
                })
                .focused($isFocused)
                .autocapitalization(.none)
                .font(.custom("Nunito", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .onChange(of: searchText) { changedText in
                    print("onchage")
                    vm.searchedWord = changedText
                    if stillShowResult {
                        print("tapped on")
                        showResult = true
                    } else {
                        print("tapped off")
                        showResult = false
                        showAutocomplete = true
                    }
                }
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .frame(width: 55, height: 50)
                        .font(.system(size: 19))
                        .offset(x: 22 )
                        .foregroundColor(Color("buttongray"))
                        .opacity(isFocused && !searchText.isEmpty ? 1.0 : 0.0)
                        .animation(.default, value: searchText)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
            }
            .frame(maxWidth: .infinity)
            .frame(height: 18)
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("strokeSearch"))
                
                
            )
            if isFocused {
                Button("Cancelar") {
                    //  withAnimation(.default) {
                    searchText = ""
                    isFocused = false
                    //     }
                }
                .font(.custom("Nunito", size: 16))
                .foregroundColor(Color("sheet"))
                .fontWeight(.semibold)
                .padding(.horizontal, 5)
                .transition(.move(edge: .trailing))
                //.animation(.default, value: isEditing)
            }
            
            
            
        }
        
    }
    
}





//onEditingChanged: { isEditing in
////   withAnimation(.default) {
//       self.isEditing = isEditing
////   }
//}
