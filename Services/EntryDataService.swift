//
//  EntryDataService.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

import Foundation
import SwiftUI
import Combine

class EntryDataService {
    
    @Published var word: [EntryModel] = []
    
    
    var wordSubscription: AnyCancellable?
    
    init(wordString: String){
        getEntry(wordString: wordString)
    }
    
    private func getEntry(wordString: String) {
        guard let url = URL(string: "http://localhost:8080/entries/\(wordString)")
        else {return}
        
        wordSubscription = NetworkingManager.download(url: url)
            .decode(type: [EntryModel].self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
                self?.word = returnedEntries
                self?.wordSubscription?.cancel()

            })
    }

    
}
