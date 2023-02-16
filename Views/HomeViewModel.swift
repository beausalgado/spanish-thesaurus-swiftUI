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
    @Published var portfolioEntries: [EntryModel] = []
    private let dataService = EntryDataServices()
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allEntries
            .sink { [weak self] (returnedEntries) in
                self?.allEntries = returnedEntries
            }
            .store(in: &cancellables)
    }
}
