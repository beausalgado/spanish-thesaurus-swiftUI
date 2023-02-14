//
//  SplashView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/30/23.
//

import SwiftUI

struct SplashViewOld: View {
    @State private var opacity  = 0.0
    @State private var isActive = false

    var body: some View {
        
        VStack {
            if self.isActive {
                HomeView()
            } else {
                Spacer()
                Image("brontosaurus")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .opacity(opacity)
                
                    .onAppear {
                          withAnimation(.easeIn(duration: 2.0)) {
                              self.opacity = 1.0
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




        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashViewOld()
    }
}
