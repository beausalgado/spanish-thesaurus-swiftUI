//
//  LikeHeart.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/3/23.
//
//
//import SwiftUI
//
//struct LikeHeart: View {
//
//    @State var likedFill: Bool
//    @State var liked: Bool
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 25, height: 25)
//                .opacity(0.3)
//                .onTapGesture {
//                    withAnimation(!liked ? .spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.25).delay(0.05) : .default.delay(0.01)) {
//                        self.liked.toggle()
//                        self.likedFill.toggle()
//                        
//                    }
//                }
//                .zIndex(2)
//            Image(systemName:"heart")
//                .font(.system(size: 20))
//                .accentColor(.black)
////                .opacity(!liked ? 0.5 : 1.0)
//                .scaleEffect(liked ? 1.05 : 1.0)
//                .frame(width: 25, height: 25)
//
//            Image(systemName: "heart.fill")
//                .foregroundColor(.black)
//                .font(.system(size: 20))
//   //             .frame(width: 25, height: 25)
//                .scaleEffect(likedFill ? 1.05 : 0.0)
////               .opacity(!liked ? 0.5 : 1.0)
//
//        }
//    }
//    
//}
//struct LikeHeart_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeHeart(likedFill: false, liked: false)
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
