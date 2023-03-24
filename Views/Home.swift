//
//  Home.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack (spacing:0) {
            
            homeHeader().padding([.leading, .trailing], 30)
                .padding([.bottom], 1)
                .padding(.top, 25)
            Divider()
                .frame(height: 0.1)
                .background(Color("strokeSearch"))
            ScrollView {
                VStack {
                    Text("Sinónimo del día")
                        .font(.custom("Nunito", size: 36, relativeTo: .title))
                        .fontWeight(.bold)
                        .frame(maxWidth:.infinity,
                               alignment:.topLeading)
                        .padding([.bottom], 12)

                    
                    synonymOfTheDay

                    recentlySearched.padding([.top])
                    
                    
                    
                    Spacer(minLength: 0)
                }
                
                .padding([.top], 25)
            }.padding([.leading, .trailing], 30)
            
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Home {
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

extension Home {
    private var recentlySearched: some View {
      VStack  {
            
            HStack {
                Text("Búsquedas recientes")
                    .font(.custom("Nunito", size: 24, relativeTo: .headline))
                    .fontWeight(.bold)
                    .frame(maxWidth:.infinity,
                           alignment:.leading)
                Spacer()
                Text("Ver más")
                    .font(.custom("Nunito", size: 16, relativeTo: .headline))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("gray"))

            }
            .padding([.top])
            .padding([.bottom], 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("banco")
                        .font(.custom("Nunito", size: 16, relativeTo: .body))
                        .fontWeight(.bold)
                    Text("hace 1 día")
                        .font(.custom("Nunito", size: 12, relativeTo: .body))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("gray"))
                    
                }
               Spacer()
                Image(systemName: "arrow.right")
                    .font(.system(size: 16))
     

            }
            Divider()
                .overlay(Color("divider"))
                .padding([.top, .bottom], 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("algarabía")
                        .font(.custom("Nunito", size: 16, relativeTo: .body))
                        .fontWeight(.bold)
                    Text("hace 2 días")
                        .font(.custom("Nunito", size: 12, relativeTo: .body))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("gray"))
                    
                }
               Spacer()
                Image(systemName: "arrow.right")
                    .font(.system(size: 16))
     

            }
            Divider()
                .overlay(Color("divider"))
                .padding([.top, .bottom], 5)
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("cuenco")
                        .font(.custom("Nunito", size: 16, relativeTo: .body))
                        .fontWeight(.bold)
                    Text("hace 5 días")
                        .font(.custom("Nunito", size: 12, relativeTo: .body))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("gray"))
                    
                }
               Spacer()
                Image(systemName: "arrow.right")
                    .font(.system(size: 16))
     

            }
            Divider()
                .overlay(Color("divider"))
                .padding([.top, .bottom], 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("casona")
                        .font(.custom("Nunito", size: 16, relativeTo: .body))
                        .fontWeight(.bold)
                    Text("el 16/01/23")
                        .font(.custom("Nunito", size: 12, relativeTo: .body))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("gray"))
                    
                }
               Spacer()
                Image(systemName: "arrow.right")
                    .font(.system(size: 16))
     

            }

            
            

            
      }
    }
}
