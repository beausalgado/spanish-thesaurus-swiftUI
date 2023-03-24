//
//  EntryViewModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

//import Foundation
//import Combine
//import SwiftUI
//
//class EntryViewModel: ObservableObject {
//    @Published var word: [EntryModel] = []
//    
//    private var cancellables = Set<AnyCancellable>()
//    private let dataService: EntryDataService
//    private let word1: EntryModel
//
//    init() {
//        dataService = EntryDataService(wordString: "abadejo")
//        addWordSubscriber()
//    }
//    
//    func addWordSubscriber() {
//        dataService.$word
//            .sink { [weak self] (returnedEntry) in
//                self?.word = returnedEntry
//            }
//            .store(in: &cancellables)
//    }
//}
