//
//  CoreDataFavorites.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/13/23.
//

import Foundation
import CoreData



class CoreDataFavorites: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedFavorites: [FavoritesEntity] = []

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
    }
    func isFavorite(text: String) -> Bool {
        return savedFavorites.contains { $0.entry?.localizedCaseInsensitiveCompare(text) == .orderedSame }
    }
    
    func fetchFavorites() {
        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
        do {
            savedFavorites = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }

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
        newFavorite.favorited = true
        newFavorite.entry = text
        saveData()
    }

    func deleteFavorite(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedFavorites[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteFavoritesByEntry(text: String) {
        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
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
    
    
// ** With a dispatch queue, a one second pause after activating the function 
//    func deleteFavoritesByEntry(text: String) {
//        // Add a 1-second delay
//        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
//            let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
//            request.predicate = NSPredicate(format: "entry == %@", text)
//
//            do {
//                let matchingEntries = try self.container.viewContext.fetch(request)
//                for entry in matchingEntries {
//                    self.container.viewContext.delete(entry)
//                }
//                self.saveData()
//            } catch let error {
//                print("Error deleting history: \(error)")
//            }
//        }
//    }
    
    
    func deleteAllFavorites() {
        for entity in savedFavorites {
            container.viewContext.delete(entity)
        }
        saveData()
    }

    func saveData(){
        do {
            try container.viewContext.save()
            fetchFavorites()
        } catch let error {
            print("Error fetching. \(error)")
        }

    }


}
