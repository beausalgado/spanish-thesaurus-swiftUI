//
//  FavoritesList.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/22/23.
//

import SwiftUI

struct FavoritesList: View {
    @EnvironmentObject var vmMongo: EntryDataService
    @State var likedFill: Bool = true
    @State var liked: Bool = true
    @State var showWord: Bool = false
    @StateObject var vm = CoreDataFavorites()
    var body: some View {
        VStack {
            
            if !showWord {
                listOfFavorites
            } else {
                wordView
            }

        }
    }
    
}

extension FavoritesList {
    
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


extension FavoritesList {
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
                    .background(Color.blue)
                    .onTapGesture {
                        vmMongo.searchedWord = entity.entry ?? ""
                        showWord = true
                    }
                    Heart(entry: entity.entry ?? "", vm: vm)
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


extension FavoritesList {
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
            
                Text("test")
                    .onTapGesture {
                        withAnimation {
                            showWord = false
                            vmMongo.isLoading = true
                            vm.fetchFavorites()
                        }

                    }
            }

        }
    }

}


struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList().environmentObject(dev.wordVM)
    }
}


