//
//  ErrorPage.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/19/23.
//

import SwiftUI

struct ErrorPage: View {
    var body: some View {
        VStack {
            Spacer()
            Image( "brontosaurus")
                .resizable()
                .frame(width: 90, height: 90)
                //.padding([.leading], 20)
                .opacity(0.20)
                .padding([.bottom], 1)
            Text("Lo lamentamos")
                .font(.custom("Nunito", size: 20, relativeTo: .body))
                .fontWeight(.bold)
            Text("No pudimos encontrar esa palabra")
                .font(.custom("Nunito", size: 18, relativeTo: .body))
            Spacer()
        }

     
    }
}

#Preview {
    ErrorPage()
}


