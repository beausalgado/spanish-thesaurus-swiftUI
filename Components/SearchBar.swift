//
//  SearchBar.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding  var isEditing: Bool
    @FocusState var focusedField: Bool
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
                    })
                    .focused($focusedField)
                    .font(.custom("Nunito", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
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
                            isEditing = false
                            focusedField = false
                        }
                    }
                    .foregroundColor(Color("sheet"))
                    .font(.custom("Nunito", size: 16))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 5)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: isEditing)
                }
                
                
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isEditing: .constant(true))
        
    }
}
