//
//  test.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    let array = ["Hello", "world", "SwiftUI", "Hello", "world", "SwiftUI", "Hello", "Hello", "hello"]
    
    
        
    
    
    
    
        var body: some View {

            let text = array.joined(separator: ", ")
                .capitalizingFirstLetter()
                + "."

            Text(text)
        }
    
    
}
struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
