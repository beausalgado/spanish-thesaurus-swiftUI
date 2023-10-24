//
//  Sheet.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/27/23.
//

import SwiftUI

struct Sheet: View {
    
    @State private var offline: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            ZStack {
                VStack {
                    
                    Capsule()
                         .fill(Color.white)
                         .frame(width: 38, height: 4)
                         .padding([.bottom])
                         .padding([.top], 6)
                    
                        Toggle(isOn: $offline,
                               label: {
                            HStack {
                                Image(systemName: "moon.fill")
                                    .font(.system(size: 20))
                                    .padding([.trailing], 8)
                                Text("Modo oscuro")
                                    .font(.body)
                                Spacer(minLength: 0)
                            }
    
                            
                        })
                    Divider()
                        .overlay(.white)
                        .padding([.top], 16)

                        
                    Spacer()
                        

                    
                }
                .foregroundColor(.white)
                .padding([.leading, .trailing], 25)
                    
            }.background(Color("sheet").ignoresSafeArea(.all))
            .preferredColorScheme(offline ? .dark : colorScheme)
    
    }
    
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        
        Sheet()
            .previewLayout(.sizeThatFits)

  
    }
}
