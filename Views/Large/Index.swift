//
//  Index.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct Index: View {
    
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
            .environmentObject(dev.wordVM)
            .environmentObject(dev.coredata)
        
    }
}
