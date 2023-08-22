//
//  testDataService.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

//import Foundation
//import Combine
//import SwiftUI
//
//class testDataServices {
//    @Published var test1: [EntryModel] = []
//    
//    var entrySubscription1: AnyCancellable?
//    init(wordString: String){
//        getEntries1(wordString: wordString)
//    }
//    
//    private func getEntries1(wordString: String) {
//        print("call API")
//        guard let url = URL(string: "http://localhost:8081/entries/fuzzy/\(wordString)")
//        else {return}
//        
//        entrySubscription1 = NetworkingManager.download(url: url)
//            .decode(type: EntryModel.self , decoder: JSONDecoder())
//            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
//                self?.test1 = [returnedEntries]
//                self?.entrySubscription1?.cancel()
//
//            })
//    }
//}
