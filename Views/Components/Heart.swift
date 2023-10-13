//
//  Heart.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/9/23.
//

import SwiftUI

struct Heart: View {
    @State var likedFill: Bool = true
    @State var liked: Bool = true
    @State var entry: String = ""
    @EnvironmentObject var vm: CoreDataFavorites
    var body: some View {
            ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 45, height: 30)
                        .opacity(0.001)
                        .onTapGesture {
                            withAnimation(!liked ? .spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.25).delay(0.05) : .default.delay(0.01)) {
                                self.liked.toggle()
                                self.likedFill.toggle()


                            }
                            withAnimation (.easeInOut(duration: 0.32)){
                                vm.deleteFavoritesByEntry(text: entry)
                            }
                        }
                        .zIndex(2)
                     //   .padding(.leading, 15)
                    Image(systemName:"heart")
                        .font(.system(size: 20))
                        .accentColor(.black)
        //                .opacity(!liked ? 0.5 : 1.0)
                        .scaleEffect(liked ? 1.05 : 1.0)
                        .frame(width: 25, height: 25)
                     //  .padding(.leading, 15)

                    Image(systemName: "heart.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
           //             .frame(width: 25, height: 25)
                        .scaleEffect(likedFill ? 1.05 : 0.0)
        //               .opacity(!liked ? 0.5 : 1.0)
                       // .padding(.leading, 15)

            } .padding(.leading, 15)
        }
}


struct Heart_Previews: PreviewProvider {
    static var previews: some View {
        Heart().environmentObject(dev.cdFavorites)
    }
}
