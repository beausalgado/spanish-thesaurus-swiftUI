//
//  ShareIcon.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/23/23.
//

import SwiftUI

struct ShareIcon: View {
    
    @State var likedFill: Bool = false
    @State var clicked: Bool = false
    @State var liked: Bool = false
    let link = URL(string: "https://www.hackingwithswift.com")!
    
    //https://www.appcoda.com/swiftui-sharelink/
    
    var body: some View {
        HStack {
            
//                                Image(systemName: clicked ?  "square.and.arrow.up.fill" : "square.and.arrow.up")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(.black)
//
//                                    .onTapGesture {
//                                        withAnimation(.default) {
//                                            self.clicked.toggle()
//                                        }}
//            
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 25, height: 25)
                    .opacity(0.01)
                    
                    
                
       //      Text("\(liked.description)")

    ShareLink(item: link) {
        Image(systemName: "square.and.arrow.up")
            .font(.system(size: 20))
            .labelStyle(.iconOnly)
            .accentColor(.black)
            .frame(width: 25, height: 25)
            .padding(.bottom, 3)
            //.opacity(0.5)

    }

                    

                
    //                    Image(systemName: clicked ?  "square.and.arrow.up.fill" : "square.and.arrow.up")
    //                        .font(.system(size: 20))
    //                        .foregroundColor(.black)
    //                        .onTapGesture {
    //                    withAnimation(.default) {
    //                        self.clicked.toggle()
    //                    }
    //                }

            }
        }
        
    }
}

struct ShareIcon_Previews: PreviewProvider {
    static var previews: some View {
        ShareIcon()
    }
}
