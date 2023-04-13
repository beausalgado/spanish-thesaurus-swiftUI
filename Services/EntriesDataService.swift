//
//  EntryDataService.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/14/23.
//

import Foundation
import Combine

class EntriesDataServices {
    @Published var allEntries: [EntryModel] = []
    
    var entrySubscription: AnyCancellable?
    init(){
        getEntries()
    }
    
    private func getEntries() {
        guard let url = URL(string: "http://localhost:8081/entries")
        else {return}
        
        entrySubscription = NetworkingManager.download(url: url)
            .decode(type: [EntryModel].self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedEntries) in
                self?.allEntries = returnedEntries
                self?.entrySubscription?.cancel()

            })
    }
}
