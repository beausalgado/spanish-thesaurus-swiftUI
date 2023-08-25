////
////  EntryDataService.swift
////  spanish-thesaurus-swiftUI
////
////  Created by Beau Salgado on 2/27/23.
//// It has the two cancellables
//
//import Foundation
//import SwiftUI
//import Combine
//
//
//class EntryDataService: ObservableObject {
//    @Published var words: [EntryModel] = []
//    @Published var searchedWord: String = ""
//    @Published var isLoading = false
//
//    var wordSubscription: AnyCancellable?
//    var textSubscription = Set<AnyCancellable>()
//
//    init(){
//        print("init")
//        searchWordsPublisher()
//
//    }
//
//
//    private func searchWordsPublisher() {
//        $searchedWord
//            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] text in
//                print("searchWordsPublisher")
//                guard !text.isEmpty else {return}
//                self?.getWords(searchterm: text.lowercased())
//            })
//            .store(in: &textSubscription)
//
//
//    }
//
//
//
//
//
//    private func getWords(searchterm: String) {
//        guard let url = URL(string: "http://localhost:8081/entries/\(searchterm)")
//        else {return}
//        wordSubscription = NetworkingManager.download(url: url)
//            .decode(type: [EntryModel].self , decoder: JSONDecoder())
//            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
//                print("getWords")
//                self?.words = returnedEntries
//                self?.isLoading = false
//                self?.wordSubscription?.cancel()
//
//            })
//
//
//
//    }
//}
//    //speed check
//    //    let start = Date() // Record start time
//    //    // Your database call here
//    //    // ...
//    //    let end = Date() // Record end time
//    //    let timeElapsed = end.timeIntervalSince(start) // Calculate time elapsed in seconds
//    //    print("Time elapsed: \(timeElapsed) seconds")
//    //
//    //    check size too
//
//
