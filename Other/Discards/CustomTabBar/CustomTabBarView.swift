//
//  CustomTabBarView.swift
//  spanish-thesaurus-swiftUI
//
//  Created by Beau Salgado on 3/24/23.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State var selection: TabBarItem = TabBarItem(iconName: "house", iconNameAnimation: "house.fill", title: "Home", color: Color.red)
    
    let tabs: [TabBarItem]
    
    var body: some View {
        HStack {
            ForEach(tabs, id:\.self) {tab in
              tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
                
            }
        }.padding(6)
        .background(
            Color.gray.opacity(0.1).ignoresSafeArea(edges: .bottom)
            )
        }

    
}


extension CustomTabBarView {
    
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack{
            Image(systemName: selection == tab ? tab.iconNameAnimation : tab.iconName)
                .font(.system(size:20))
//            Text(tab.title)
//                .font(.custom("Nunito", size: 10))
//                .fontDesign(.rounded)
//
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.default){
            selection = tab
        }
        
        
    }
    
}

struct TabBarItem: Hashable {
    let iconName: String
    let iconNameAnimation: String
    let title: String
    let color: Color
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", iconNameAnimation: "house.fill", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", iconNameAnimation: "heart.fill", title: "Liked", color: Color.blue),
        TabBarItem(iconName: "magnifyingglass.circle", iconNameAnimation: "magnifyingglass.circle.fill", title: "Delete", color: Color.green)
    ]
    static var previews: some View {
        VStack{
            Spacer()
            CustomTabBarView(tabs: tabs)
        }

    }
}
