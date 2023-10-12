////
////  FavoritesTab.swift
////  spanish-thesaurus-swiftUI
////
////  Created by Beau Salgado on 2/9/23.
////
//
//import SwiftUI
//
//struct FavoritesTab: View {
//    var body: some View {
//        VStack (spacing:0) {
//            header.padding([.leading, .trailing], 30)
//                .padding([.bottom], 1)
//                .padding(.top, 25)
//            Divider()
//                .frame(height: 0.1)
//                .background(Color("strokeSearch"))
//            ScrollView {
//
//
//
//                FavoritesList().padding([.leading, .trailing], 30)
//                    .padding([.top], 20)
//
//
//                Spacer()
//
//
//            }
//        }//.padding(.top, 25)
//    }
//}
//
//
//
//struct Favorites_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            FavoritesTab().environmentObject(dev.wordVM)
//        }
//    }
//}
//
//
//
//
