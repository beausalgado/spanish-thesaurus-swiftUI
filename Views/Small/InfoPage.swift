//
//  InfoPage.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/19/23.
//

import SwiftUI

struct InfoPage: View {
    var body: some View {
        VStack (spacing:0) {
            
            HomeHeader().padding([.leading, .trailing], 30)
                .padding([.bottom], 1)
                .padding(.top, 25)
            Divider()
                .frame(height: 0.1)
                .background(Color("strokeSearch"))
            
            HStack (spacing:0){
                Text("Hi, I'm Beau!")
                    .font(.custom("Nunito", size: 22, relativeTo: .body))
                    .fontWeight(.bold)
                    .padding([.top])
                    .padding([.leading], 32)
                   
                Spacer()
            }

            Text("This is an app that I created in 2023 as a portfolio project. I didn’t know any Swift a few months ago, but I wanted to learn and implement a new language from scratch as well as gain more confidence in my ability to code.")
                .padding([.top])
                .padding([.leading, .trailing], 30)

            Text("A few years ago when I was living in Mexico City and taking classes in Spanish literature, I remember searching for a Spanish thesaurus app and couldn’t find anything that fit my needs. Building the app is a kind of tip of the hat to that moment in my life.")
                .padding([.top])
                .padding([.leading, .trailing], 30)
            Spacer()
        }
    }
}

#Preview {
    InfoPage()
}
