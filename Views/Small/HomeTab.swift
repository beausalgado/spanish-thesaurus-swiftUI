//
//  HomeTab.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI

struct HomeTab: View {
    @EnvironmentObject var data: EntryDataService
    var body: some View {
        
        VStack (spacing:0) {
            
            HomeHeader().padding([.leading, .trailing], 30)
                .padding([.bottom], 1)
                .padding(.top, 25)
            Divider()
                .frame(height: 0.1)
                .background(Color("strokeSearch"))
                Text("Sinónimo del día")
                    .font(.custom("Nunito", size: 36, relativeTo: .title))
                    .fontWeight(.bold)
                    .frame(maxWidth:.infinity,
                           alignment:.topLeading)
                    .padding([.bottom], 12)
                    .padding([.top], 25)
                    .padding([.leading, .trailing], 30)
            ScrollView {
                VStack {


                        if let filterVM = data.randomWord.first {
                            EntryRow(data:filterVM)
                        }
              
                    
                        
                        Spacer(minLength: 0)
                    }
                        
                }
                    .padding([.leading, .trailing], 30)
                    .refreshable {
                        data.getRandom()
            }
            
        }

    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab().environmentObject(dev.wordVM)
            .environmentObject(dev.coredata)
    }
}

extension HomeTab {
    private var synonymOfTheDay: some View {
        ZStack {
            Rectangle()
                //.frame(width: 350, height: 160)
                .cornerRadius(16)
                .foregroundColor(Color("offwhite"))
                .shadow(color: .black.opacity(0.1),
                        radius: 5.0,
                        x: 0.0,
                        y: 5.0
                )
                                 
            VStack(alignment: .leading, spacing:0){
                HStack {
                    Text("atizar")
                        .font(.custom("Nunito", size: 32, relativeTo: .title))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16))
                        .background(
                        Circle()
                            .fill(Color("buttongray"))
                            .frame(width: 28, height: 28)
                        )
                }
                
                Text("verbo")
                    .font(.custom("Nunito", size: 14, relativeTo: .body))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("gray"))
                    .padding([.bottom], 10)
                Text("Avivar, excitar, estimular, activar, remover, azuzar, aguijonear...")
                    .font(.custom("Nunito", size: 16, relativeTo: .body))
                Spacer()
            }.padding( )
        

        }//.frame(width: 350, height: 160)
        
    }
}

