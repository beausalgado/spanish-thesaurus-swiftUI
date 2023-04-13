//
//  testchat.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/1/23.
//

import SwiftUI

// MARK: - Entry
struct EntryModel1: Identifiable, Codable, Hashable {
    let id, entry: String
    let meanings: [Meaning1]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case entry, meanings
    }
}

// MARK: - Meaning1
struct Meaning1: Codable, Hashable {
    let synonyms: [String]
    let idioms, americanisms, antonyms: [String]?
}

struct testchat: View {
    
    let entries = [
        spanish_thesaurus_swiftUI.EntryModel1(id: "63f5121a4223e38dbb24e227", entry: "abad", meanings: [spanish_thesaurus_swiftUI.Meaning1(synonyms: ["prior", "superior", "rector", "capellán", "clérigo"], idioms: nil, americanisms: nil, antonyms: nil)]),
        spanish_thesaurus_swiftUI.EntryModel1(id: "63f5121a4223e38dbb24e216", entry: "abadejo", meanings: [spanish_thesaurus_swiftUI.Meaning1(synonyms: ["bacalao"], idioms: nil, americanisms: nil, antonyms: nil), spanish_thesaurus_swiftUI.Meaning1(synonyms: ["reyezuelo", "régulo", "cantárida"], idioms: nil, americanisms: nil, antonyms: nil)])
    ]
    @State var text: String = ""
    @FocusState var focused: Bool
    var body: some View {
        
        VStack{

            if let entry = entries.first(where: { $0.entry == "abad" }) {
                Text("Entry found: \(entry.entry)")
            } else {
                Text("Entry not found")
            }
            
        }

        
    }
    
}
struct testchat_Previews: PreviewProvider {
    static var previews: some View {
        testchat()
    }
}
