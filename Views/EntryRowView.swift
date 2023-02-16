//
//  EntryRowView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/16/23.
//

import SwiftUI

struct EntryRowView: View {
    
    let entry: EntryModel
    

    
    var body: some View {
        VStack {
            Text(entry.entry)
            Text(entry.id)
            Text(entry.meaning1?.synonyms[1])
        }
    }
}

struct EntryRowView_Previews: PreviewProvider {
    static var previews: some View {
        EntryRowView(entry: dev.entry)
    }
}
