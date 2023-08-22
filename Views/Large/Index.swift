//
//  Index.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct Index: View {
    
    // searxg terms: afectado,afirmar, apestar, aplastar
    // https://medium.com/@konuralpdemirtas/in-xcode-13-swift-5-adding-core-data-to-existing-project-757d2db3fe31
   @State private var splashView: Bool = true
    
    var body: some View {
        
        ZStack   {
            
            VStack {
                Spacer(minLength: 0)
                Tabs()
                
            }
            
            ZStack {
             
                
                if splashView {
                    Splash()
                        .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                            withAnimation(.linear(duration: 0.3)) {
                                splashView.toggle()
                            }
                        }
                    }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

            Index()
        
    }
}
