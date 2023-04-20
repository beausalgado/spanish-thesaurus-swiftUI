//
//  CoreDataTest1.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/20/23.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
    container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }

    }
    
}


class CoreDataTest1ViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var entries: [EntryEntity] = []
    
}

struct CoreDataTest1: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataTest1_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataTest1()
    }
}
