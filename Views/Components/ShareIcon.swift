//
//  ShareIcon.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/23/23.
//

import SwiftUI

struct ShareIcon: View {
    
    let link = URL(string: "https://www.hackingwithswift.com")!

    
    var body: some View {
        HStack {
                 
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 25, height: 25)
                    .opacity(0.01)
                    
                    


    ShareLink(item: link) {
        Image(systemName: "square.and.arrow.up")
            .font(.system(size: 20))
            .labelStyle(.iconOnly)
            .accentColor(.black)
            .frame(width: 25, height: 25)
            .padding(.bottom, 3)
            //.opacity(0.5)

    }

                    


            }
        }
        
    }
}

struct ShareIcon_Previews: PreviewProvider {
    static var previews: some View {
        ShareIcon()
    }
}
