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
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let entry = EntryModel(
        id: "63ea9b2da538bfd8b38176e3",
        entry: "abadejo",
        meaning1: Meaning1(synonyms: [
        "test1",
        "test2",
        "test3"
        ])
    )
    
}
