//
//  SearchBar.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 8/25/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @FocusState.Binding var isFocused: Bool
    @Binding var showAutocomplete: Bool
    @Binding var showResult: Bool
    @Binding var stillShowResult: Bool
    @EnvironmentObject var vm: EntryDataService
    @EnvironmentObject var cdhistory: CoreDataHistory
    
    var body: some View {
        VStack (spacing:0){
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            searchText.isEmpty ? .black.opacity(0.3) : .black.opacity(0.8)
                        )
                        .animation(.default, value: searchText)
                    TextField("Buscar", text: $searchText, onCommit: {
                        showAutocomplete = false
                        showResult = true
                        if (!cdhistory.isInHistory(text: searchText)){
                            cdhistory.addHistory(text: searchText)
                        }
                    })
                    .focused($isFocused)
                    .autocapitalization(.none)
                    .font(.custom("Nunito", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    .onChange(of: searchText) { changedText in
                        vm.searchedWord = changedText
                        vm.isLoading = true
                        if stillShowResult {
                            showResult = true
                        } else {
                            showResult = false
                            showAutocomplete = true
                        }
                        cdhistory.showAll = false
                        cdhistory.saveData()
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
                        searchText = ""
                        isFocused = false
                    }
                    .font(.custom("Nunito", size: 16))
                    .foregroundColor(Color("sheet"))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 5)
                    .transition(.move(edge: .trailing))
                }
            }.padding(.horizontal, 30)
            .padding([.bottom], 1)
            Divider()
                .frame(height: 0.1)
                .background(Color("strokeSearch"))
                .padding([.top], 20)
        }.padding(.top, 25)
           
    }
}




//struct SearchBar1_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(searchText: .constant("false"), isFocused: <#FocusState<Bool>.Binding#>, showAutocomplete: .constant(false), showResult: .constant(false), stillShowResult: .constant(false))
//    }
//}
