//
//  test1ViewModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/27/23.
//

import Foundation
import Combine
import SwiftUI

class test1ViewModel: ObservableObject {
    @Published var test1: [EntryModel] = []
    private let string1: String
    private let dataService: testDataServices!
    
    private var cancellables = Set<AnyCancellable>()

    init(string1: String) {
        self.string1 = string1
        self.dataService = testDataServices(wordString: string1)
       // super.init()
        add1Subscribers()
    }
    
    func add1Subscribers() {
        dataService.$test1
            .sink { [weak self] (returnedEntries) in
                self?.test1 = returnedEntries
            }
            .store(in: &cancellables)
    }
    

}
