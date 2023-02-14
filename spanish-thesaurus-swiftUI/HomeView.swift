//
//  ContentView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 12/29/22.
//

import SwiftUI

struct HomeView: View {
    
 
    @State private var showSheet: Bool = false
    @State private var splashView: Bool = true
    
    var body: some View {
    
        ZStack   {
            VStack {

                HStack {
                    Image("brontosaurus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding([.leading], 20)
                        .opacity(0.6)
                    Spacer()


                    
                    Button(action: {
                            showSheet.toggle()
                    }, label: {
                        Label("Hamburger", systemImage: "line.3.horizontal")
                            .labelStyle(.iconOnly)
                            .foregroundColor(Color.black)
                            .padding([.trailing], 30)
                    })
                    .sheet(isPresented: $showSheet) {
                        sheetView()
                            .presentationDetents([ .fraction(0.30)])
                           Spacer(minLength: 0)

                    }
                    



            }
                Spacer(minLength: 0)
                Tabs()
                
            }
            
            ZStack {
                if splashView {
                    SplashView().onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                            withAnimation(.linear(duration: 0.3)) {
                                splashView.toggle()
                            }
                        }
                    }
 
                }
            }.zIndex(2.0)
        }
            
        
 
         
        
    }
   
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()

    }
}
