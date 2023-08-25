//
//  CapitalizedFirstLetter.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/22/23.
//

import Foundation
import SwiftUI


extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    func capitalizeSecond() -> String {
        guard self.count > 1 else { return self }
        let firstChar = self.prefix(1)
        let secondChar = self[self.index(self.startIndex, offsetBy: 1)...self.index(self.startIndex, offsetBy: 1)].capitalized
        let rest = self.dropFirst(2)
        return "\(firstChar)\(secondChar)\(rest)"
    }
    
    
}
