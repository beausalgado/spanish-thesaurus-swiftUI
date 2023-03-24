//
//  EntryModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/14/23.
//

import Foundation

// MARK: - Entry
//struct EntryModel: Identifiable, Codable {
//    let id, entry: String
//    let meaning1: Meaning1?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case entry, meaning1
//    }
//}
//
//// MARK: - Meaning1
//struct Meaning1: Codable {
//    let synonyms: [String]
//}


// MARK: - Entry
struct EntryModel: Identifiable, Codable {
    let id, entry: String
    let meanings: [Meaning]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case entry, meanings
    }
}

// MARK: - Meaning1
struct Meaning: Codable {
    let synonyms: [String]
    let idioms, americanisms, antonyms: [String]?
}


