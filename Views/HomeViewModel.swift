//
//  HomeViewModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/16/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allEntries: [EntryModel] = []
    private let dataService = EntriesDataServices()
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers1()
    }
    
    func addSubscribers1() {
        dataService.$allEntries
            .sink { [weak self] (returnedEntries) in
                self?.allEntries = returnedEntries
            }
            .store(in: &cancellables)
    }
}
