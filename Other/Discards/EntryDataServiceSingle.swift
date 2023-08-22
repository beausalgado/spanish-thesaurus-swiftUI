//
//  EntryDataServiceSingle.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/3/23.
//

//import Foundation
//import SwiftUI
//import Combine
//
//class EntryDataServiceSingle: ObservableObject {
//    
//    @Published var word1: [EntryModel] = []
//    @Published var searchedWord1: String = ""
//    @State var typing: Bool = false
//    
//    
//    var wordSubscription: AnyCancellable?
//    var textSubscription = Set<AnyCancellable>()
//    
//    init(){
//        print("initialized")
//        searchedWordPublisher()
//    }
//    
//    private func searchedWordPublisher() {
//            $searchedWord1
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .sink(receiveValue: { text in
//                
//                print("runs searchedwordpublisher")
//                if text.isEmpty {
//                    print("emptynot")
//                    return
//                } else {
//               self.typing = true
//               self.getEntry(searchterm: text.lowercased())
//                }
//                })
//            .store(in: &textSubscription)
//            
//
//        
//    }
//    
//    
//    private func getEntry(searchterm: String) {
//            guard let url = URL(string: "http://localhost:8081/entries/\(searchterm)")
//            else {return}
//            wordSubscription = NetworkingManager.download(url: url)
//                .decode(type: EntryModel.self , decoder: JSONDecoder())
//                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
//                    print("runs getEntry")
//                    
//                    self?.word1 = [returnedEntries]
//                    self?.wordSubscription?.cancel()
//
//                })
//            
//        
//  
//    }
//
//    
//}

