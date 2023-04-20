////
////  UserFavoritesAndHistory.swift
////  spanish-thesaurus-swiftUI
////
////  Created by Beau Salgado on 4/13/23.
////
//
//import Foundation
//import CoreData
//
//
//
//class CoreDataFavorites: ObservableObject {
//
//    let container: NSPersistentContainer
//    @Published var savedEntities: [FavoritesEntity] = []
//
//    init () {
//        container = NSPersistentContainer(name: "FavoritesAndHistoryContainer")
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("ERROR LOADING CORE DATA. \(error)")
//            }
//        }
//        fetchFavorites()
//    }
//
//    func fetchFavorites() {
//        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
//        do {
//           savedEntities = try container.viewContext.fetch(request)
//        } catch let error {
//            print("Error fetching. \(error)")
//        }
//
//    }
//
//    func addFavorite(text: String) {
//        let newFavorite = FavoritesEntity(context: container.viewContext)
//        newFavorite.entry = text
//        saveData()
//    }
//
//    func deleteFavorite(indexSet: IndexSet) {
//        guard let index = indexSet.first else {return}
//        let entity = savedEntities[index]
//        container.viewContext.delete(entity)
//        saveData()
//    }
//
//    func saveData(){
//        do {
//            try container.viewContext.save()
//            fetchFavorites()
//        } catch let error {
//            print("Error fetching. \(error)")
//        }
//
//    }
//
//
//}
