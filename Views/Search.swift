//
//  Search.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/31/23.
//

import SwiftUI



struct Search: View {
    @State var searchText: String = ""
    @State var searchFocused: Bool = false
    @State var isEditing: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchBar(searchText: $searchText, isEditing: $isEditing)
                    Spacer()

          
            }

                busquedasRecientes()
                NavigationLink("go here", destination: Favorites())
                Spacer()
            }
            
        
        }.padding(25)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

struct busquedasRecientes: View {
    var body: some View {
        VStack {
            
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
            .padding([.top])
            .padding([.bottom], 15)
            
            HStack {
                    Text("banco")
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
            
            HStack {
                    Text("cuenco")
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
            HStack {
                    Text("algarabía")
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
            HStack {

                    Text("casona")
                        .font(.custom("Nunito", size: 16, relativeTo: .body))
                        .fontWeight(.bold)
 
                    
                
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 15))
                    .foregroundColor(Color("strokeSearch"))
                
                
            }
            
            
            
            
            
        }
    }
}
