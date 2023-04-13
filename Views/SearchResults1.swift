//
//  SearchResults1.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/30/23.
//

//import SwiftUI
//
//struct SearchResults1: View {
//   @StateObject var vm: EntryDataService
//    var body: some View {
//            ScrollView {
//                VStack(alignment: .leading) {
//                         results
//                    Spacer(minLength: 0)
//                    TextField("type", text: $vm.searchedWord)
//                }.padding([.leading, .trailing], 30)
//                    .padding([.top])
//                
//                
//            
//            }
//    }
//    
//    
//    
//}
//
//struct SearchResults1_Previews: PreviewProvider {
//    static var previews: some View {
//SearchResults1(vm: dev.wordVM1)
//    }
//}
//
//extension SearchResults1 {
//
//    private var results: some View {
//        VStack {
//            ForEach(vm.word) { entry in
//                EntryRowView(data: entry)
//            }
//
//
//        }
//    }
//}
//
//
