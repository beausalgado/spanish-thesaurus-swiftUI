//
//  TrimTrailing.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/22/23.
//

import Foundation
import SwiftUI

extension String {
   func trimingTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }

        return String(self[...index])
    }
}
