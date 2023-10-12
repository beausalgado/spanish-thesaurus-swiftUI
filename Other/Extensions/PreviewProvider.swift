//
//  PreviewProvider.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/16/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
 

    static var instance: DeveloperPreview {
        return DeveloperPreview()
     }
    init (){}
    
    let wordVM = EntryDataService()

    
 
    
    let entry = EntryModel(
        id: "63ea9b2da538bfd8b38176e7",
        entry: "Abajadero",
        meanings: [Meaning(
            synonyms: [
                "bajada",
                "pendiente",
                "cuesta",
                "declive",
                "bajada",
                "pendiente",
                "bajada",
                "pendiente"
            ],
            idioms: [
                "bajada por la calle",
                "pendiente a marte",
                "cuesta al lado",
                "declive por el monte"
            ],
            americanisms: [
                "hey ho (amer.)",
                "water in the hole (amer.)",
                "make it fair (amer.)",
                "bla bla bla (amer.)"
            ],
            antonyms: [
                "bajada",
                "pendiente",
                "cuesta",
                "declive"
            ]),
                   Meaning(
                       synonyms: [
                           "bajada2",
                           "pendiente2",
                           "cuesta2",
                           "declive2"
                       ],
                       idioms: [
                           "bajada por la calle2",
                           "pendiente a marte2",
                           "cuesta al lado2",
                           "declive por el monte2"
                       ],
                       americanisms: [
                           "hey ho2",
                           "water in the hole2",
                           "make it fair2",
                           "bla bla bla2"
                       ],
                       antonyms: [
                           "bajada2",
                           "pendiente2",
                           "cuesta2",
                           "declive2"
                       ])
        
        
        
        ])
    
    
}


//EntryModel(
//    id: "63ea9b2da538bfd8b38176e7",
//    entry: "abajadero",
//    meanings: [Meaning(
//        synonyms: [
//            "bajada",
//            "pendiente",
//            "cuesta",
//            "declive",
//            "bajada",
//            "pendiente",
//            "bajada",
//            "pendiente"
//        ],
//        idioms: [
//            "bajada por la calle",
//            "pendiente a marte",
//            "cuesta al lado",
//            "declive por el monte"
//        ],
//        americanisms: [
//            "hey ho (amer.)",
//            "water in the hole (amer.)",
//            "make it fair (amer.)",
//            "bla bla bla (amer.)"
//        ],
//        antonyms: [
//            "bajada",
//            "pendiente",
//            "cuesta",
//            "declive"
//        ])}
