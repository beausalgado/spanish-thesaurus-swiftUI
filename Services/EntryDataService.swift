//
//  EntryDataService.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/14/23.
//

import Foundation


class EntryDataServices {
    @Published var allEntries: [EntryModel] = []
    
    init(){
        getEntries()
    }
    
    private func getEntries() {
        guard let url = URL(string: "http://localhost:8080/entries") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on:DispatchQueue.main)
            .decode(type: [EntryModel].self , decoder: JSONDecoder())
            .sink { (completion) in
                switch completion
            }
    }
}
