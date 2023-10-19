//
//  CoreData.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/13/23.
//

import Foundation
import CoreData



class CoreData: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedFavorites: [FavoritesEntity] = []
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
        fetchFavorites()
        fetchHistory()
    }
    func isFavorite(text: String) -> Bool {
        return savedFavorites.contains { $0.entry?.localizedCaseInsensitiveCompare(text) == .orderedSame }
    }
    
    func isInHistory(text: String) -> Bool {
        return savedHistory.contains { $0.entry?.localizedCaseInsensitiveCompare(text) == .orderedSame }
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
    
    func fetchFavorites() {
        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
        do {
            savedFavorites = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }

    }
    
    func isLastHistory(_ history: HistoryEntity) -> Bool {
        // Sort the savedHistory array by timestamp (oldest first)
        let sortedHistory = savedHistory.sorted { ($0.timestamp ?? Date()) < ($1.timestamp ?? Date()) }

        guard let firstIndex = sortedHistory.firstIndex(of: history) else {
            return false // The item is not in the sorted array
        }

        return firstIndex == 0 // Check if it's the oldest item
    }
    
    func isLastFavorite(_ favorite: FavoritesEntity) -> Bool {
        // Sort the savedFavorites array alphabetically by entry
        let sortedFavorites = savedFavorites.sorted { ($0.entry ?? "") < ($1.entry ?? "") }

        guard let lastIndex = sortedFavorites.firstIndex(of: favorite) else {
            return false // The item is not in the sorted array
        }

        return lastIndex == sortedFavorites.count - 1
    }

    func addFavorite(text: String) {
        let newFavorite = FavoritesEntity(context: container.viewContext)
        newFavorite.timestamp = Date()
        newFavorite.entry = text
        saveFavoritesData()
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
        saveHistoryData()
    }


    func deleteFavorite(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedFavorites[index]
        container.viewContext.delete(entity)
        saveFavoritesData()
    }
    
    func deleteHistory(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedHistory[index]
        container.viewContext.delete(entity)
        saveHistoryData()
    }
    
    func deleteHistoryByEntry(text: String) {
        let request = NSFetchRequest<HistoryEntity>(entityName: "HistoryEntity")
        request.predicate = NSPredicate(format: "entry == %@", text)

        do {
            let matchingEntries = try container.viewContext.fetch(request)
            for entry in matchingEntries {
                container.viewContext.delete(entry)
            }
            saveHistoryData()
        } catch let error {
            print("Error deleting history: \(error)")
        }
    }
    
    func deleteFavoritesByEntry(text: String) {
        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
        request.predicate = NSPredicate(format: "entry == %@", text)

        do {
            let matchingEntries = try container.viewContext.fetch(request)
            for entry in matchingEntries {
                container.viewContext.delete(entry)
            }
            saveFavoritesData()
        } catch let error {
            print("Error deleting history: \(error)")
        }
    }
    

    
    func deleteAllHistory() {
        for entity in savedHistory {
            container.viewContext.delete(entity)
        }
        saveHistoryData()
    }
    
    
    func deleteAllFavorites() {
        for entity in savedFavorites {
            container.viewContext.delete(entity)
        }
        saveFavoritesData()
    }

    func saveFavoritesData(){
        do {
            try container.viewContext.save()
            fetchFavorites()
        } catch let error {
            print("Error fetching. \(error)")
        }

    }
    func saveHistoryData(){
        do {
            try container.viewContext.save()
            fetchHistory()
        } catch let error {
            print("Error fetching. \(error)")
        }

    }


}
