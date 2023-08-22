////
////  recentlySearched.swift
////  spanish-thesaurus-swiftUI
////
////  Created by Beau Salgado on 3/2/23.
////
//
//import SwiftUI
//
//struct recentlySearched: View {
//    @StateObject var vm = CoreDataFavorites()
//    @State var text: String = ""
//    var body: some View {
//        
//        VStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            TextField("Add stuff", text: $text)
//            Button {
//                guard !text.isEmpty else {return}
//                vm.addFavorite(text: text)
//                text = ""
//            } label: {
//                Text("Button")
//                    .frame(height: 55)
//            }
//            
//            List {
//                ForEach(vm.savedEntities) { entity in
//                    Text(entity.entry ?? "No entry")
//                }.onDelete(perform: vm.deleteFavorite)
//            }
//        }
//       
//
//    }
//}
//
//struct recentlySearched_Previews: PreviewProvider {
//    static var previews: some View {
//        recentlySearched()
//    }
//}
