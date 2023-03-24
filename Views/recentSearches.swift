//
//  recentSearches.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/2/23.
//

import SwiftUI

struct recentSearches: View {
    let testArray = ["banco", "cuenco", "algarabía", "casona"]
    var body: some View {
        
        
        VStack {
            
            recentSearchTitle.padding([.top])
                .padding([.bottom], 15)
            
            ForEach(testArray.indices, id: \.self) { index in
                
                if index == testArray.indices.last {
                    HStack {
                        Text("\(testArray[index])")
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "xmark")
                            .font(.system(size: 15))
                            .foregroundColor(Color("strokeSearch"))
                        
                        
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
                        Image(systemName: "xmark")
                            .font(.system(size: 15))
                            .foregroundColor(Color("strokeSearch"))
                        
                        
                    }
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
                }
                            
                
            }
        }

    }
    
}
struct recentSearches_Previews: PreviewProvider {
    static var previews: some View {
        recentSearches()
    }
}


extension recentSearches {
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

