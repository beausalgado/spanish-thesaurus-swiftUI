//
//  Xmark.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/13/23.
//

import SwiftUI

struct Xmark: View {
    @State var entry: String = ""
    @EnvironmentObject var vm: CoreData
    var body: some View {
            ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 40, height: 30)
                        .opacity(0.001)
                        .onTapGesture {
                            withAnimation (.easeInOut(duration: 0.32)){
                                vm.deleteHistoryByEntry(text: entry)
                            }
                        }
                        .zIndex(1)
                        .padding([.leading], 25)
                    Image(systemName:"xmark")
                         .font(.system(size: 15))
                         .foregroundColor(Color("strokeSearch"))
                        .frame(width: 25, height: 25)
                        .padding([.leading], 25)


            }
    }
}

#Preview {
    Xmark()
}
