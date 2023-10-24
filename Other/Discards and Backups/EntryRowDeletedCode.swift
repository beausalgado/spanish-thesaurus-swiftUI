//
//  EntryRowDeletedCode.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 10/5/23.
//

//import SwiftUI

//if (self.data.meanings[index].idioms != nil){
//    Text("Locuciones")
//        .font(.custom("Nunito", size: 14, relativeTo: .body))
//        .fontWeight(.bold)
//    HStack(spacing:0) {
//        let text = data.meanings[index].idioms!.joined(separator: ", ")
//            .capitalizingFirstLetter()
//        + "."
//
//        Text(text)
//            .font(.custom("Nunito", size: 14, relativeTo: .body))
//                .italic()
//                Spacer()
//        Spacer()
//    }.padding([.bottom])
//}


//                        HStack(spacing:0) {
//                        ForEach (data.meanings[index].synonyms.indices, id: \.self) { subIndex in
//
//                            if(subIndex == 0){
//                                Text("\(data.meanings[index].synonyms[subIndex])".capitalizedSentence)
//                            } else {
//                                if(subIndex + 1 == data.meanings[index].synonyms.count){
//                                        Text(", \(data.meanings[index].synonyms[subIndex]).")
//                                } else {
//                                    Text(", \(data.meanings[index].synonyms[subIndex])")
//                                }
//
//                            }
//
//
//
//                            }
//                        }.padding([.bottom])




//                    if (self.data.meanings[index].idioms != nil){
//                        Text("Locuciones")
//                            .font(.custom("Nunito", size: 16, relativeTo: .body))
//                            .fontWeight(.bold)
//                        HStack(spacing:0) {
//                        ForEach (data.meanings[index].idioms!.indices, id: \.self) { subIndex in
//
//                            if(subIndex == 0){
//                                Text("\(data.meanings[index].idioms![subIndex])".capitalizedSentence)
//                            } else {
//                                if(subIndex + 1 == data.meanings[index].idioms!.count){
//                                        Text(", \(data.meanings[index].idioms![subIndex]).")
//                                } else {
//                                    Text(", \(data.meanings[index].idioms![subIndex])")
//                                }
//
//                            }
//
//
//
//                            }
//                        }.padding([.bottom])                    }



//                    if (self.data.meanings[index].idioms != nil){
//                        Text("Locuciones")
//                            .font(.custom("Nunito", size: 16, relativeTo: .body))
//                            .fontWeight(.bold)
//                        HStack (spacing:0) {
//
//                            ForEach (self.data.meanings[index].synonyms, id: \.self) { idiom in
//
//                                Text(idiom)
//
//                            }
//                        }
//                    }
//                    if (self.data.meanings[index].americanisms != nil){
//                        Text("Americanismos")
//                            .font(.custom("Nunito", size: 16, relativeTo: .body))
//                            .fontWeight(.bold)
//                        HStack {
//                            ForEach (self.data.meanings[index].americanisms!, id: \.self) { americanism in
//
//                                Text(americanism)
//
//                            }
//                        }
//                    }
//
//                    if (self.data.meanings[index].antonyms != nil){
//                        Text("Antónimos")
//                            .font(.custom("Nunito", size: 16, relativeTo: .body))
//                            .fontWeight(.bold)
//                        HStack {
//                            ForEach (self.data.meanings[index].antonyms!, id: \.self) { antonym in
//
//                                Text(antonym)
//
//                            }
//                        }
//                    }

