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
            savedHistory = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }

    }
    func isInHistory(text: String) -> Bool {
        return savedHistory.contains { $0.entry?.localizedCaseInsensitiveCompare(text) == .orderedSame }
    }

    func addHistory(text: String) {
        let newHistory = HistoryEntity(context: container.viewContext)
        newHistory.timestamp = Date()
        newHistory.favorited = true
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
            savedHistory.removeAll { $0.entry == text }
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
