//
//  FavoritesTab.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/22/23.
//

import SwiftUI

struct FavoritesTab: View {
    @EnvironmentObject var vmMongo: EntryDataService
    @EnvironmentObject var vm: CoreData
    @State var likedFill: Bool = true
    @State var liked: Bool = true
    @State var showWord: Bool = false
    @State var showFavorites: Bool = true
    @State private var showSheet: Bool = false
    @State private var splashView: Bool = true
    @State var arrowBoolean: Bool = true
    var body: some View {
        VStack (spacing:0){
            header.padding([.leading, .trailing], 30)
                            .padding([.bottom], 1)
                            .padding(.top, 25)
            Divider()
                            .frame(height: 0.1)
                            .background(Color("strokeSearch"))
                          
            ScrollView {
                VStack {
                    
                    if !showWord && showFavorites {
                        listOfFavorites
                    } else {
                        wordView
                    }

                }.padding([.leading, .trailing], 30)
                    .padding([.top], 20)
            }
        }
    }
    
}

extension FavoritesTab {
    
    private var LikeHeart: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 25, height: 25)
                .opacity(0.3)
                .onTapGesture {
                    withAnimation(!liked ? .spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.25).delay(0.05) : .default.delay(0.01)) {
                        self.liked.toggle()
                        self.likedFill.toggle()
                        
                    }
                }
                .zIndex(2)
            Image(systemName:"heart")
                .font(.system(size: 20))
                .accentColor(.black)
//                .opacity(!liked ? 0.5 : 1.0)
                .scaleEffect(liked ? 1.05 : 1.0)
                .frame(width: 25, height: 25)

            Image(systemName: "heart.fill")
                .foregroundColor(.black)
                .font(.system(size: 20))
   //             .frame(width: 25, height: 25)
                .scaleEffect(likedFill ? 1.05 : 0.0)
//               .opacity(!liked ? 0.5 : 1.0)

        }
    }
}


extension FavoritesTab {
    private var listOfFavorites: some View {
        VStack {
            ForEach(vm.savedFavorites.sorted { $0.entry?.localizedCaseInsensitiveCompare($1.entry ?? "") == .orderedAscending }, id: \.self){ entity in
                    
                HStack(spacing:0) {
                    HStack {
                            Text(entity.entry ?? "")
                                .font(.custom("Nunito", size: 16, relativeTo: .body))
                                .fontWeight(.bold)
                            Spacer()
 
                        }
                    .background(Color.white)
                    .onTapGesture {
                        vmMongo.searchedWord = entity.entry ?? ""
                        showWord.toggle()
                        showFavorites.toggle()
                        arrowBoolean.toggle()
                    }
                    Heart(entry: entity.entry ?? "", vm: _vm)
                }
                if !vm.isLastFavorite(entity) {
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
 
                }
            }
        }
    }
}


extension FavoritesTab {
    private var wordView: some View {
        
        VStack {
            
            if vmMongo.isLoading {
                ProgressView()
            } else {
                if let convert = vmMongo.words.first {
                    EntryRowFavorites(deleteWord: convert.entry, data: convert)
                        .opacity(showWord ? 1 : 0)
                        .animation( .easeInOut(duration: 4), value:showWord) // Apply animation based on showWord

                }
            
            }

        }
    }

}


struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesTab()
            .environmentObject(dev.wordVM)
            .environmentObject(dev.coredata)
    }
}


extension FavoritesTab {
    

   private var header: some View {
        HStack   {
            if arrowBoolean {
                Image( "brontosaurus")
                    .resizable()
                    .frame(width: 40, height: 40)
                    //.padding([.leading], 20)
                    .opacity(0.85)
                    .padding([.bottom], 12)
            } else {
                
                Button(action: {
                    withAnimation {
                        vmMongo.isLoading = true
                        vm.fetchFavorites()
                        showWord.toggle()
                        showFavorites.toggle()
                        arrowBoolean = true
                    }
                 
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                    //    .padding(.trailing, 20)
                })

            }


            Spacer()
            Button(action: {
                showSheet.toggle()
            }, label: {
                Label("Hamburger", systemImage: "line.3.horizontal")
                    .font(.system(size: 25))
                    .labelStyle(.iconOnly)
                    .foregroundColor(Color.black)
               //     .padding([.trailing], 30)
            })
            .sheet(isPresented: $showSheet) {
                Sheet()
                    .presentationDetents([ .fraction(0.30)])

                
            }
            
            
            
            
            
        }// .animation(.easeInOut(duration: 0.2))
       
    }
}
