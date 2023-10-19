//
//  EntryRow.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 2/16/23.
//

import SwiftUI

struct EntryRow: View {
    @State var likedFill: Bool = false
    @State var liked: Bool = false
    @EnvironmentObject var coredata: CoreData
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

                                Text("\"\(data.meanings[index].idioms![subIndex]).\""
                                    .capitalizeSecond()
                                )
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
        EntryRow(data: dev.entry).environmentObject(dev.coredata)
    }
}

extension EntryRow {
    
    
    
    private var entryTitle: some View {
        HStack {
            Text(data.entry)
                .font(.custom("Nunito", size: 24, relativeTo: .body))
                .fontWeight(.bold)
                .padding([.bottom], 8)
            Spacer(minLength: 0)
            
            ShareIcon()
            LikeHeart
            
            
        }
    }
}

extension EntryRow {
    
    
    private var LikeHeart: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 25, height: 25)
                .opacity(0.01)
                .onTapGesture {
                    withAnimation(!liked ? .spring(response: 0.3, dampingFraction: 0.45, blendDuration: 0.25).delay(0.05) : .default.delay(0.01)) {
                        self.liked.toggle()
                        self.likedFill.toggle()
                        if (!coredata.isFavorite(text: data.entry)){
                            coredata.addFavorite(text: data.entry)
                        }
                        
                    }
                }
                .zIndex(2)
            Image(systemName:"heart")
                .font(.system(size: 20))
                .accentColor(.black)
//                .opacity(!liked ? 0.5 : 1.0)
                .scaleEffect(liked ? 1.05 : 1.0)
                .frame(width: 25, height: 25)

            Image(systemName: "heart.fill")
                .foregroundColor(.black)
                .font(.system(size: 20))
   //             .frame(width: 25, height: 25)
                .scaleEffect(likedFill ? 1.05 : 0.0)
//               .opacity(!liked ? 0.5 : 1.0)

        }
    }
}

