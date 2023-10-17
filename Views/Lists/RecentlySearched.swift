//
//  RecentlySearched.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/2/23.
//

import SwiftUI

struct RecentlySearched: View {
    @EnvironmentObject var vm: CoreDataHistory
    var body: some View {
        
        
        ScrollView {
            
            recentSearchTitle
                .padding([.bottom], 15)
            
            listOfHistory
        }

    }
    
}
struct recentSearches_Previews: PreviewProvider {
    static var previews: some View {
        RecentlySearched().environmentObject(dev.cdHistory)
    }
}


extension RecentlySearched {
    private var recentSearchTitle: some View {
        HStack {
            Text("Recientes")
                .font(.custom("Nunito", size: 24, relativeTo: .headline))
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,
                       alignment:.leading)
            Spacer()
            
            if !vm.showAll {
                Button(action: {
                    vm.showAll = true
                    vm.fetchHistory()
                }) {
                    Text("Ver todos")
                        .font(.custom("Nunito", size: 16, relativeTo: .headline))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("gray"))
                }}

            
        }
        
    }
    
}

extension RecentlySearched {
    private var listOfHistory: some View {
        
        VStack {
            ForEach(vm.savedHistory, id: \.self){ entity in
                
                HStack(spacing:0) {
                    HStack {
                        Text(entity.entry ?? "")
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .fontWeight(.bold)
                        Spacer()
                        
                    }
                    .background(Color.white)
                    .onTapGesture {
                        
                    }
                    Xmark(entry: entity.entry ?? "", vm: _vm)
                    
                }
                if !vm.isLastHistory(entity) {
                    Divider()
                        .overlay(Color("divider"))
                        .padding([.top, .bottom], 5)
                    
                }
            }

      //      Text("vm: \(vm.savedHistory.description)")
        }
    }
}
