//
//  ViewEntities.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 9/19/23.
//

import SwiftUI

struct ViewEntities: View {
    @EnvironmentObject var vm: CoreDataFavorites
    @EnvironmentObject var vm1: CoreDataHistory
    var body: some View {
        
        ScrollView {
//            Text("Favorites")
//                .font(.custom("Nunito", size: 36, relativeTo: .title))
//            ForEach(vm.savedFavorites.sorted(by: { $0.timestamp ?? Date() > $1.timestamp ?? Date() }), id: \.self) { entity in
//                Text(entity.entry ?? "nothing")
//                Text("\(entity.timestamp ?? Date()).")
//            }
            Text("History")
                .font(.custom("Nunito", size: 36, relativeTo: .title))
            ForEach(vm1.savedHistory.sorted(by: { $0.timestamp ?? Date() > $1.timestamp ?? Date() }), id: \.self) { entity in
                Text(entity.entry ?? "nothing")
                Text("\(entity.timestamp ?? Date()).")
            }
            
            Button {
                withAnimation {
                    //                    vm.deleteFavoritesByEntry(text: "habilidoso")
                    vm1.deleteAllHistory()
//                    vm.deleteAllFavorites()
                    //                }
                    //                vm1.deleteAllHistory()
                    //             vm.deleteAllFavorites()
                }
            } label: {
                Text("Click here for action")
            }

            
        }
     
    }
}

//#Preview {
//    ViewEntities().environmentObject(dev.cdFavorites).environmentObject(dev.cdHistory)
//}
