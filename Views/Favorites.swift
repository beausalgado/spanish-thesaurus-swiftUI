//
//  Favorites.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/9/23.
//

import SwiftUI

//struct Favorites: View {
//    @State var searchText: String = ""
//    @State var isEditing: Bool = false
//    @State var searched: Bool = false
//    @State var showFuzzyResults: Bool = false
//    @State var showResults: Bool = false
//    @State var showRecents: Bool = true
//    @FocusState var isFocused: Bool
//    var body: some View {
//        VStack (spacing:0) {
//            searchbar.padding(.horizontal, 30)             
//            Divider()
//                .overlay(Color("divider"))
//                .padding([.top, .bottom], 5)
//            ScrollView {
//
//
//                    
//                FavoritesList().padding([.leading, .trailing], 30)
//                
//                Spacer()
//
//
//            }
//        }.padding(.top, 25)
//    }
//}
//
//
//
//struct Favorites_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Favorites()
//        }
//    }
//}
//
//
//
//
//extension Favorites {
//        
//        private var searchbar: some View {
//                HStack {
//                    HStack {
//                        
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(
//                                searchText.isEmpty ? .black.opacity(0.3) : .black.opacity(0.8)
//                            )
//                        
//                            .animation(.default, value: searchText)
//                        
//                        TextField("Buscar", text: $searchText , onEditingChanged: { isEditing in
//                            withAnimation(.default) {
//                                self.isEditing = isEditing
//                            }
//                        }, onCommit: {
//                            withAnimation {
//                                isEditing = false
//                                showFuzzyResults = false
//                                showResults.toggle()
//                                print("comitted")
//                            }
//                        })
//                        .focused($isFocused)
//                        .font(.custom("Nunito", size: 16))
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                        .disableAutocorrection(true)
//                        .onChange(of: searchText) { _ in
//                            
//                            if searchText != "" {
//                                withAnimation {
//                                    showFuzzyResults = true
//                                    showRecents = false
//                                    
//                                }
//                            }
//                            
//                        }
//                        .overlay(
//                            Image(systemName: "xmark.circle.fill")
//                                .frame(width: 55, height: 50)
//                            // .background(.red.opacity(0.5))
//                                .font(.system(size: 19))
//                                .offset(x: 22 )
//                                .foregroundColor(Color("buttongray"))
//                                .opacity(isFocused && !searchText.isEmpty ? 1.0 : 0.0)
//                                .animation(.default, value: searchText)
//                                .onTapGesture {
//                                    //   UIApplication.shared.endEditing()
//                                    searchText = ""
//                                    showFuzzyResults = false
//                                    
//                                }
//                            ,alignment: .trailing
//                        )
//                    }
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 18)
//                    .font(.headline)
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(Color("strokeSearch"))
//                        
//                        
//                    )
//                    if isEditing {
//                        Button("Cancelar") {
//                            withAnimation(.default) {
//                                searchText = ""
//                                isFocused = false
//                                isEditing = false
//                                showFuzzyResults = false
//                                showRecents = true
//                                showResults = false
//                            }
//                            //                        .onTapGesture {
//                            //                            UIApplication.shared.endEditing()
//                            //                                searchText = ""
//                            //
//                            //                            }
//                        }
//                        .font(.custom("Nunito", size: 16))
//                        .foregroundColor(Color("sheet"))
//                        .fontWeight(.semibold)
//                        .padding(.horizontal, 5)
//                        .transition(.move(edge: .trailing))
//                        //.animation(.default, value: isEditing)
//                    }
//                    
//                    
//                    
//                }
//                
//            }
//    
//    }
