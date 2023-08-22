//
//  EntryDataService.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

import Foundation
import SwiftUI
import Combine


class EntryDataService: ObservableObject {
    @Published var words: [EntryModel] = []
    @Published var searchedWord: String = ""
    @Published var isLoading = false

    var wordSubscription: AnyCancellable?
    var textSubscription = Set<AnyCancellable>()

    init(){
         print("init")
            searchWordsPublisher()

    }


    private func searchWordsPublisher() {
            $searchedWord
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
                .sink(receiveValue: { [weak self] text in
                    print("searchWordsPublisher")
                    guard !text.isEmpty else {return}
                        self?.getWords(searchterm: text.lowercased())
                })
                .store(in: &textSubscription)


    }





    private func getWords(searchterm: String) {
            guard let url = URL(string: "http://localhost:8081/entries/\(searchterm)")
            else {return}
            wordSubscription = NetworkingManager.download(url: url)
                .decode(type: [EntryModel].self , decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
                    print("getWords")
                    self?.words = returnedEntries
                    self?.isLoading = false
                    self?.wordSubscription?.cancel()

                })



    }

    //speed check
    //    let start = Date() // Record start time
    //    // Your database call here
    //    // ...
    //    let end = Date() // Record end time
    //    let timeElapsed = end.timeIntervalSince(start) // Calculate time elapsed in seconds
    //    print("Time elapsed: \(timeElapsed) seconds")
    //
    //    check size too
    

//class EntryDataService: ObservableObject {
//
//    @Published var words: [EntryModel] = []
//    @Published var searchedWord: String = ""
//    @Published var isLoading = false
//
//    var wordSubscription = Set<AnyCancellable>()
//
//    init(){
//        searchWordsPublisher()
//    }
//
//    private func searchWordsPublisher() {
//        $searchedWord
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] text in
//                guard !text.isEmpty else {return}
//                //print("words")
//                self?.getWords(searchterm: text.lowercased())
//
//            })
//            .store(in: &wordSubscription)
//    }
//
//
//
//    private func getWords(searchterm: String) {
//        guard let url = URL(string: "http://localhost:8081/entries/\(searchterm)") else {
//            return
//        }
//
//        NetworkingManager.download(url: url)
//            .decode(type: [EntryModel].self, decoder: JSONDecoder())
//            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
//              //  print("wordsget")
//                self?.words = returnedEntries
//                self?.isLoading = false
//            })
//            .store(in: &wordSubscription)
//
//    }
//
    
    
    //speed check
    
    //    let start = Date() // Record start time
    
    //    // Your database call here
    
    //    // ...
    
    //    let end = Date() // Record end time
    
    //    let timeElapsed = end.timeIntervalSince(start) // Calculate time elapsed in seconds
    
    //    print("Time elapsed: \(timeElapsed) seconds")
    
    //
    
    //    check size too
    
    
    

    
    
    
  
    
    //    private func searchedWordPublisher() {
    //            $searchedWord
    //            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
    //            .sink(receiveValue: { [weak self] text in
    //                guard !text.isEmpty else {return}
    //
    //                print("search")
    //               self?.getEntry(searchterm: text.lowercased())
    //                self?.show = true
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
    //                    print("searchget")
    //                    self?.word = [returnedEntries]
    //                    self?.wordSubscription?.cancel()
    //
    //
    //                })
    //
    //
    //
    //    }
    
    
}





//class EntryDataService: ObservableObject {
//    @Published var words: [EntryModel] = []
//    @Published var words: [EntryModel] = []
//    @Published var searchedFuzzy: String = ""
//    @Published var searchedWord: String = ""
//    @Published var committed: Bool = false
//    
//    var wordSubscription: AnyCancellable?
//    var textSubscription = Set<AnyCancellable>()
//    
//    init(){
//
//            print("init")
//            searchWordsPublisher()
//
//    }
//    
//    
//    private func searchWordsPublisher() {
//            $searchedFuzzy
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//                .sink(receiveValue: { [weak self] text in
//                    print(self!.committed)
//                    guard !text.isEmpty else {return}
//                   
//                    print(text)
//                    
//                    if self!.committed {
//                        print("normal")
//                        self?.getAll(searchterm: text.lowercased(), urlTerrmination: "")
//                    } else {
//                        print("words")
//                        self?.getAll(searchterm: text.lowercased(), urlTerrmination: "words/")
//                    }
////               //     self?.getAll(searchterm: text.lowercased(), urlTerrmination: "")
////                    self?.getAll(searchterm: text.lowercased(), urlTerrmination: "words/")
//                })
//                .store(in: &textSubscription)
//            
//
//    }
//    
//    
//
//    
//    private func getAll(searchterm: String, urlTerrmination: String) {
//            guard let url = URL(string: "http://localhost:8081/entries/\(urlTerrmination)\(searchterm)")
//            else {return}
//            wordSubscription = NetworkingManager.download(url: url)
//                .decode(type: [EntryModel].self , decoder: JSONDecoder())
//                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
//                 //   print("fuzzyget")
//                    self?.words = returnedEntries
//                    self?.wordSubscription?.cancel()
//
//                })
//            
//        
//  
//    }
//    
//    
//    
//
//    
//}
