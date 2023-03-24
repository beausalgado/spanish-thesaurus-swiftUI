//
//  FavoritesList.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/22/23.
//

import SwiftUI

struct FavoritesList: View {
    let testArray = ["banco", "cuenco", "algarabía", "casona", "curvo", "monolito", "gregario"]
    var body: some View {
        
        
        VStack {
            

            
            ForEach(testArray.indices, id: \.self) { index in
                
                if index == testArray.indices.last {
                    HStack {
                        Text("\(testArray[index])")
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .fontWeight(.bold)
                        Spacer()
                        LikeHeart()
                        
                        
                    }
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
                    
                } else {
                    
                    
                    HStack {
                        Text("\(testArray[index])")
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .fontWeight(.bold)
                        Spacer()
                        LikeHeart()
                        
                        
                    }
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
                }
                            
                
            }
        }.padding([.top])
    
    }
    
}



extension FavoritesList {
    private var recentSearchTitle: some View {
        HStack {
            Text("Recientes")
                .font(.custom("Nunito", size: 24, relativeTo: .headline))
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,
                       alignment:.leading)
            Spacer()
            Text("Ver todos")
                .font(.custom("Nunito", size: 16, relativeTo: .headline))
                .fontWeight(.semibold)
                .foregroundColor(Color("gray"))
            
        }
    }
    
}


struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList()
    }
}
