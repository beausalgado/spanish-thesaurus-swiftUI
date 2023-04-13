//
//  EntryViewModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

//import Foundation
//import Combine
//
//class EntryViewModel: ObservableObject {
//    @Published var word: [EntryModel] = []
//    private var searchedWord: String = "abad"
//    private let dataService = EntryDataService()
//    private var cancellables = Set<AnyCancellable>()
// 
//
//    init() {
//        addWordSubscriber()
//    }
//    
//    func addWordSubscriber() {
//        dataService.$searchedWord
//            .sink { [weak self] (returnedEntry) in
//                self?.searchedWord = returnedEntry
//            }
//            .store(in: &cancellables)
//        dataService.$word
//            .sink { [weak self] (returnedEntry) in
//                self?.word = returnedEntry
//            }
//            .store(in: &cancellables)
//
//    }
//}
