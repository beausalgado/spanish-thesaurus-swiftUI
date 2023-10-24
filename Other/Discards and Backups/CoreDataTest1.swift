////
////  CoreDataTest1.swift
////  spanish-thesaurus-swiftUI
////
////  Created by Beau Salgado on 4/20/23.
////
//
//import SwiftUI
//import CoreData
//
//class CoreDataManager {
//    
//    static let instance = CoreDataManager()
//    let container: NSPersistentContainer
//    let context: NSManagedObjectContext
//    
//    init() {
//    container = NSPersistentContainer(name: "FavoritesAndHistoryContainer")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                print("Error loading Core Data. \(error)")
//            }
//        }
//        context = container.viewContext
//    }
//    
//    func save() {
//        do {
//            try context.save()
//            print("Saved successfully")
//        } catch let error {
//            print("Error saving Core Data. \(error.localizedDescription)")
//        }
//
//    }
//    
//}
//
//
//class CoreDataTest1ViewModel: ObservableObject {
//    
//
//    
//    let manager = CoreDataManager.instance
//    @Published var entries: [EntryModel] = []
//    
//        init(){
//            getEntries()
//        }
//    
//    func getEntries() {
//        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
//
//        do {
//            let results = try manager.context.fetch(request)
//
//        } catch let error {
//            print("Error fetching. \(error.localizedDescription)")
//        }
//    }
//    
//    
//    
//    
//
//
//
//    let manager = CoreDataManager.instance
//    @Published var entries: [EntryEntity] = []
//
//    init(){
//        getEntries()
//    }
//
//    func getEntries() {
//        let request = NSFetchRequest<EntryEntity>(entityName: "EntryEntity")
//
//
//
//        do {
//            try entries = manager.context.fetch(request)
//        } catch let error {
//            print("Error fetching. \(error.localizedDescription)")
//        }
//    }
//
//    func addEntry() {
//        let newEntry = Struct(context: manager.context)
//        let entryModel = EntryModel(
//            id: "63ea9b2da538bfd8b38176e7",
//            entry: "abajadero",
//            meanings: [Meaning(
//                synonyms: [
//                    "bajada",
//                    "pendiente",
//                    "cuesta",
//                    "declive",
//                    "bajada",
//                    "pendiente",
//                    "bajada",
//                    "pendiente"
//                ],
//                idioms: [
//                    "bajada por la calle",
//                    "pendiente a marte",
//                    "cuesta al lado",
//                    "declive por el monte"
//                ],
//                americanisms: [
//                    "hey ho (amer.)",
//                    "water in the hole (amer.)",
//                    "make it fair (amer.)",
//                    "bla bla bla (amer.)"
//                ],
//                antonyms: [
//                    "bajada",
//                    "pendiente",
//                    "cuesta",
//                    "declive"
//                ])])
//
//        let transformer = EntryModelValueTransformer()
//        if let entryModelData = transformer.transformedValue(entryModel) as? NSData {
//            newEntry.item = entryModelData
//            print("worked")
//        }
//        save()
//        getEntries()
//    }
//
//    func save() {
//        manager.save()
//    }
//
//
//}
//
//struct CoreDataTest1: View {
//
//    @StateObject var vm = CoreDataTest1ViewModel()
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack {
//                    Button {
//                        vm.addEntry()
//                    } label: {
//                        Text("Perform Action")
//                    }.padding()
//                    ForEach(vm.entries) { item in
//                        Text(item.entry)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct CoreDataTest1_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreDataTest1()
//    }
//}
//
//
//struct EntryView: View {
//
//    let entity: EntryEntity
//
//    var body: some View {
//        VStack {
//            Text("Name: \(entity.name ??  "")")
//                .bold()
//
//            if let meanings = entity.meanings?.allObjects as? [MeaningEntity] {
//                Text("Meanings:")
//                    .bold()
////                ForEach(meanings) { meaning in
////                    Text(meaning.)
//                //}
//            }
//        }
//
//    }
//}
