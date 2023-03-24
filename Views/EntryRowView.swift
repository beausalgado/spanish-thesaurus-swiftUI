//
//  EntryRowView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/16/23.
//

import SwiftUI

struct EntryRowView: View {
    @State var liked: Bool = false
    let data: EntryModel
    
    
    var body: some View {
        VStack (alignment:.leading, spacing:0) {
            VStack (alignment: .leading) {
                entryTitle
                ForEach(data.meanings.indices, id:\.self) { index in
                    Text("\(index + 1).")
                        .font(.custom("Nunito", size: 20, relativeTo: .body))
                        .fontWeight(.bold)
                    

                    HStack(spacing:0) {
                        let synonyms = data.meanings[index].synonyms.joined(separator: ", ")
                            .capitalizingFirstLetter()
                        + "."
                        
                        Text(synonyms)
                            .font(.custom("Nunito", size: 16, relativeTo: .body))
                            .lineSpacing(0)
                        Spacer()
                    }.padding([.bottom], 5)
                    
                    if (self.data.meanings[index].americanisms != nil){
                        Text("Americanismos")
                            .font(.custom("Nunito", size: 14, relativeTo: .body))
                            .fontWeight(.bold)
                        HStack(spacing:0) {
                            let americanisms = self.data.meanings[index].americanisms!.joined(separator: ", ")
                                .capitalizingFirstLetter()
                            + "."
                            let removeAmer = americanisms.replacingOccurrences(of: "\\s*\\(amer\\.\\)\\s*", with: "", options: .regularExpression)

                            Text(removeAmer)                            .font(.custom("Nunito", size: 14, relativeTo: .body))
                                .italic()
                            Spacer()
                        }.padding([.bottom], 5)
                    }

                    if (self.data.meanings[index].idioms != nil){
                        Text("Locuciones")
                            .font(.custom("Nunito", size: 14, relativeTo: .body))
                            .fontWeight(.bold)
                        VStack(alignment:.leading, spacing:0) {
                            ForEach (data.meanings[index].idioms!.indices, id: \.self) { subIndex in

                                Text("\"\(data.meanings[index].idioms![subIndex]).\"".capitalizeSecond())
                                    .font(.custom("Nunito", size: 14, relativeTo: .body))
                                    .italic()
                            }


                    }.padding([.bottom], 5)

            }


                    if (self.data.meanings[index].antonyms != nil){
                        Text("Antónimos")
                            .font(.custom("Nunito", size: 14, relativeTo: .body))
                            .fontWeight(.bold)
                        HStack(spacing:0) {
                            let text = data.meanings[index].antonyms!.joined(separator: ", ")
                                .capitalizingFirstLetter()
                            + "."

                            Text(text)
                                .font(.custom("Nunito", size: 14, relativeTo: .body))
                                .italic()
                            Spacer()
                            Spacer()
                        }.padding([.bottom], 25)
                    }

                    
                }
                
            }
            
            
        }.frame(maxWidth: .infinity)
     
       
    }
    
    
    
}

struct EntryRowView_Previews: PreviewProvider {
    static var previews: some View {
        EntryRowView(data: dev.entry)
    }
}

extension EntryRowView {


    private var entryTitle: some View {
        HStack {
            Text(data.entry)
                .font(.custom("Nunito", size: 35, relativeTo: .body))
                .fontWeight(.bold)
                .padding([.bottom], 8)
            Spacer(minLength: 0)

            ShareIcon()
            LikeHeart()


        }
    }
}


extension String {
    func capitalizeSecond() -> String {
        guard self.count > 1 else { return self }
        let firstChar = self.prefix(1)
        let secondChar = self[self.index(self.startIndex, offsetBy: 1)...self.index(self.startIndex, offsetBy: 1)].capitalized
        let rest = self.dropFirst(2)
        return "\(firstChar)\(secondChar)\(rest)"
    }
}


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

