//
//  fuzzyResults.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/2/23.
//

import SwiftUI

struct fuzzyResults: View {
    let testArray = ["banco", "cuenco", "algarabía", "casona"]
    var body: some View {
        VStack {
            

            
            ForEach(testArray.indices, id: \.self) { index in
                
                if index == testArray.indices.last {
                    HStack {
                        Text("\(testArray[index])")
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .fontWeight(.bold)
                        Spacer()
                        
                        
                        
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
                        
                        
                        
                    }
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
                }
                            
                
            }
            

            
        }
    }
    
}



extension fuzzyResults {
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


struct fuzzyResults_Previews: PreviewProvider {
    static var previews: some View {
        fuzzyResults()
    }
}
