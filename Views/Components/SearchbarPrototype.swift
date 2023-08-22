//
//  SearchbarPrototype.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct SearchbarPrototype: View {
    @State var searchText: String = ""
    @State  var isEditing: Bool = false
    @State var showFuzzyResults: Bool = false
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            HStack {
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            searchText.isEmpty ? .black.opacity(0.3) : .black.opacity(0.8)
                        )
                    
                        .animation(.default, value: searchText)
                    
                    TextField("Buscar", text: $searchText , onEditingChanged: { isEditing in
                        withAnimation(.default) {
                            self.isEditing = isEditing
                        }
                    }, onCommit: {
                        withAnimation {
                            isEditing = false
                        }
                    })
                    .focused($isFocused)
                    .font(.custom("Nunito", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    .onChange(of: searchText) { _ in
                        
                        if searchText != "" {
                            withAnimation {
                                showFuzzyResults = true
                            }
                        }

                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 18)
                .font(.headline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("strokeSearch"))
                    
                    
                )
                if isEditing {
                    Button("Cancelar") {
                        withAnimation(.default) {
                            searchText = ""
                            isFocused = false
                            isEditing = false
                            showFuzzyResults = false
                        }
//                        .onTapGesture {
//                            UIApplication.shared.endEditing()
//                                searchText = ""
//
//                            }
                    }
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 5)
                    .transition(.move(edge: .trailing))
                    //.animation(.default, value: isEditing)
                }
                
                
                
            }
        }
    }
}

struct SearchBar_Prototype_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarPrototype()
        
    }
}
