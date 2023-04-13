//
//  UserFavoritesAndHistory.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/13/23.
//

import Foundation
import CoreData


class UserFavoritesAndHistory: ObservableObject {
    
    let container: NSPersistentContainer
    
    init () {
        container = NSPersistentContainer(name: "FavoritesAndHistoryContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successful")
            }
        }
        
    }
    
}
