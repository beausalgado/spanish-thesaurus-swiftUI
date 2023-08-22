//
//  Sheet.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 1/27/23.
//

import SwiftUI

struct Sheet: View {
    
    @State private var offline: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Capsule()
                     .fill(Color.white)
                     .frame(width: 38, height: 4)
                     .padding([.bottom], 20)
                
                    Toggle(isOn: $offline,
                           label: {
                        HStack {
                            Image(systemName: "square.and.arrow.down.fill")
                                .font(.system(size: 20))
                                .padding([.trailing], 10)
                            Text("Descargar diccionario offline")
                                .font(.body)
                            Spacer(minLength: 0)
                        }

                        
                    })
                Divider()
                    .overlay(.white)
                    .padding([.leading, .trailing], 25)
                    .padding([.top, .bottom], 5)
                HStack{
                    Image(systemName: "info.circle.fill")
                        .font(.system(size: 20))
                        .padding([.trailing], 10)
                    Text("Info")
                        .font(.body)
                    Spacer(minLength: 0)
                }
                
                Divider()
                    .overlay(.white)
                    .padding([.leading, .trailing], 25)
                    .padding([.top, .bottom], 5)
                
                HStack{
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 20))
                        .padding([.trailing], 10)
                    Text("Configuración")
                        .font(.body)
                    Spacer(minLength: 0)
                }
                    
                Spacer()
                    

                
            }
            .foregroundColor(.white)
            .padding([.leading, .trailing], 25)
                
        }.background(Color("sheet").ignoresSafeArea(.all))
    
    }
    
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        
            Sheet()
            .previewLayout(.sizeThatFits)

  
    }
}
