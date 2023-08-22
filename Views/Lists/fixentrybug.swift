//
//  fixentrybug.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 8/22/23.
//

import SwiftUI

struct EntryRow1: View {
   @State var liked: Bool = false
    let data: EntryModel


    var body: some View {
        VStack (alignment:.leading, spacing:0) {
            VStack (alignment: .leading) {
                entryTitle
                ForEach(data.meanings.indices, id:\.self) { index in
                    Text("\(index + 1).")
                      //  .font(.custom("Nunito", size: 20, relativeTo: .body))
                      //  .fontWeight(.bold)


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

struct EntryRow1iew_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow1(data: dev.entry)
    }
}

extension EntryRow1 {


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


