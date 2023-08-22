//
//  AutocompleteResults.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/2/23.
//

import SwiftUI

struct AutocompleteResults: View {
    
    let data: EntryModel
    var body: some View {
        VStack {
            
            
            
            HStack {
                Text("\(data.entry)")
                    .font(.custom("Nunito", size: 16, relativeTo: .body))
                    .fontWeight(.bold)
                Spacer()
                
                
                
                
                
                
                
   //             Text("\(String(describing: data))")
                
                
                
            }.background()
            Divider()
                .overlay(Color("divider"))
                .padding([.top, .bottom], 5)
            
            
        }
        
        
    }
    
    
}




extension AutocompleteResults {
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


struct AutocompleteResults_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteResults(data: dev.entry)
    }
}
