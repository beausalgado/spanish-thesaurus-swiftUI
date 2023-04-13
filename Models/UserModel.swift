//
//  UserModel.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/13/23.
//

import Foundation


struct UserModel: Identifiable, Codable, Hashable {
    let id: String
    let favorites: [FavoritesWord]
    let history: [HistoryWord]
    
}

struct FavoritesWord: Codable, Hashable {
    let word: String
    let timestamp: Date
}

struct HistoryWord: Codable, Hashable {
    let word: String
    let timestamp: Date
}

