//
//  ErrorPage.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/19/23.
//

import SwiftUI

struct ErrorPage: View {
    @Binding var palabraNoEncontrada: String
    var body: some View {
            Text("No se encuentra la palabra: \(palabraNoEncontrada)")

     
    }
}

#Preview {
    ErrorPage(palabraNoEncontrada: .constant("gagaga"))
}


