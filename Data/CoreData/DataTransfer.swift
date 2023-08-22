//
//  DataTransfer.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/24/23.
//

//import Foundation
//
//class EntryModelValueTransformer: ValueTransformer {
//    
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let entryModel = value as? EntryModel else { return nil }
//        return try? JSONEncoder().encode(entryModel)
//    }
//    
//    override func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let data = value as? Data else { return nil }
//        return try? JSONDecoder().decode(EntryModel.self, from: data)
//    }
//    
//}
