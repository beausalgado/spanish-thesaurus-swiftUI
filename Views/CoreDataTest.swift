//
//  CoreDataTest.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 4/13/23.
//

import SwiftUI

struct CoreDataTest: View {
    @StateObject var vm = UserFavoritesAndHistory()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataTest_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataTest()
    }
}
