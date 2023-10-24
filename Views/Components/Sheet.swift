//
//  Sheet.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/27/23.
//

import SwiftUI

struct Sheet: View {
    
    @State private var offline: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            ZStack {
                VStack {
                    
                    Capsule()
                         .fill(Color.white)
                         .frame(width: 38, height: 4)
                         .padding([.bottom])
                         .padding([.top], 6)
                    
                    HStack (spacing:0){
                        Image(systemName: "info.circle")
                            .padding([.trailing], 10)
                        Text("Info")
                            .font(.custom("Nunito", size: 22, relativeTo: .body))
                            .fontWeight(.bold)

    
                        Spacer()
                    }                            .padding([.leading], 32)

                    Text("Hi, I'm Beau! This is an app that I created in 2023 as a portfolio project. I didn’t know any Swift a few months ago, but I wanted to learn and implement a new language from scratch as well as gain more confidence in my ability to code.")            .padding([.top], 4)
                        .padding([.leading, .trailing], 30)
 

                    Text("A few years ago when I was living in Mexico City and taking classes in Spanish literature, I remember searching for a Spanish thesaurus app and couldn’t find anything that fit my needs. Building the app is a kind of tip of the hat to that moment in my life.")
                        .padding([.top])
                        .padding([.leading, .trailing], 30)
                    Spacer()
                    
//                        Toggle(isOn: $offline,
//                               label: {
//                            HStack {
//                                Image(systemName: "moon.fill")
//                                    .font(.system(size: 20))
//                                    .padding([.trailing], 8)
//                                Text("Modo oscuro")
//                                    .font(.body)
//                                Spacer(minLength: 0)
//                            }
//    
//                            
//                        })
//                    Divider()
//                        .overlay(.white)
//                        .padding([.top], 16)
//
//                        
//                    Spacer()
//                        

                    
                }
                .foregroundColor(.white)
                .padding([.leading, .trailing], 5)
                    
            }.background(Color("sheet").ignoresSafeArea(.all))
            .preferredColorScheme(offline ? .dark : colorScheme)
    
    }
    
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        
        Sheet()
            .previewLayout(.sizeThatFits)

  
    }
}
