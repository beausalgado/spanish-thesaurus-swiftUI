//
//  testchat.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/1/23.
//

import SwiftUI

struct testchat: View {
    @StateObject private var vm: test1ViewModel
    init (string1: String) {
        _vm = StateObject(wrappedValue: test1ViewModel(string1: string1))
    }
    var body: some View {
    
        ScrollView(){



                        VStack {
                            if vm.test1.count >= 1 {
                                let secondEntry = vm.test1[0]
                                Text(secondEntry.entry)
                                EntryRowView(data: secondEntry)
                            }
                        }
        }
    }

}

struct testchat_Previews: PreviewProvider {
    static var previews: some View {
        testchat(string1: "abad")
    }
}
