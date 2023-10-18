//
//  CoreDataHistory.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 9/19/23.
//

import Foundation
import CoreData


class CoreDataHistory: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedHistory: [HistoryEntity] = []
    @Published var showAll = false

    init () {
        container = NSPersistentContainer(name: "FavoritesAndHistoryContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("loaded successfully")
            }
        }
        fetchHistory()
    }
    
    func fetchHistory() {
        let request = NSFetchRequest<HistoryEntity>(entityName: "HistoryEntity")
        do {
            var fetchedHistory = try container.viewContext.fetch(request)
            fetchedHistory.sort { $0.timestamp ?? Date() > $1.timestamp ?? Date() }
            if showAll || fetchedHistory.count < 10 {
                savedHistory = fetchedHistory
                showAll = true 
            } else {
                savedHistory = Array(fetchedHistory.prefix(10))
                
            }

        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func isInHistory(text: String) -> Bool {
        return savedHistory.contains { $0.entry?.localizedCaseInsensitiveCompare(text) == .orderedSame }
    }
    
    func isLastHistory(_ history: HistoryEntity) -> Bool {
        // Sort the savedHistory array by timestamp (oldest first)
        let sortedHistory = savedHistory.sorted { ($0.timestamp ?? Date()) < ($1.timestamp ?? Date()) }

        guard let firstIndex = sortedHistory.firstIndex(of: history) else {
            return false // The item is not in the sorted array
        }

        return firstIndex == 0 // Check if it's the oldest item
    }

    func addHistory(text: String) {
        if savedHistory.count >= 30 {
            let sortedHistory = savedHistory.sorted { ($0.timestamp ?? Date()) < ($1.timestamp ?? Date()) }
            if let oldestHistory = sortedHistory.first {
                container.viewContext.delete(oldestHistory)
            }
        }
        
        let newHistory = HistoryEntity(context: container.viewContext)
        newHistory.timestamp = Date()
        newHistory.entry = text
        saveData()
    }

    func deleteHistory(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedHistory[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteHistoryByEntry(text: String) {
        let request = NSFetchRequest<HistoryEntity>(entityName: "HistoryEntity")
        request.predicate = NSPredicate(format: "entry == %@", text)

        do {
            let matchingEntries = try container.viewContext.fetch(request)
            for entry in matchingEntries {
                container.viewContext.delete(entry)
            }
            saveData()
        } catch let error {
            print("Error deleting history: \(error)")
        }
    }
    func deleteAllHistory() {
        for entity in savedHistory {
            container.viewContext.delete(entity)
        }
        saveData()
    }

    func saveData(){
        do {
            try container.viewContext.save()
            fetchHistory()
        } catch let error {
            print("Error fetching. \(error)")
        }

    }


}
