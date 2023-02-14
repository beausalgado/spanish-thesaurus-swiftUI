//
//  Splash2.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity  = 0.0
    @State private var size  = 0.9
    @State private var rotating = 350.0

    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack {

                    Spacer()
                    Image("brontosaurus")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .opacity(opacity)
                        .scaleEffect(size)
                        .rotationEffect(.degrees(rotating))
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.4)) {
                                  self.opacity = 1.0
                                  self.size = 1.0
                                self.rotating = 360
                              }
                          }

                    Spacer()
                        Text("Tesaurio")
                            .font(.custom("Nunito", size: 24))
                        .fontWeight(.bold)
                        Text("by Beau Salgado")
                            .font(.custom("Nunito", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("gray"))
                        .padding([.bottom])
                }
            
        }





        }
    
}

struct Splash2_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
