//
//  HomeHeader.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/23/23.
//

import SwiftUI


struct HomeHeader: View {
    
    @State private var showSheet: Bool = false
    @State private var splashView: Bool = true
    var body: some View {
        HStack   {
            Image("brontosaurus")
                .resizable()
                .frame(width: 40, height: 40)
                //.padding([.leading], 20)
                .opacity(0.6)
            Spacer()
            Button(action: {
                showSheet.toggle()
            }, label: {
                Label("Hamburger", systemImage: "line.3.horizontal")
                    .font(.system(size: 25))
                    .labelStyle(.iconOnly)
                    .foregroundColor(Color.black)
               //     .padding([.trailing], 30)
            })
            .sheet(isPresented: $showSheet) {
                Sheet()
                    .presentationDetents([ .fraction(0.30)])

                
            }
            
            
            
            
            
        }
       
    }
}

struct homeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
