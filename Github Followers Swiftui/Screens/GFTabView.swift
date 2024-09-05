//
//  GFTabView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFTabView: View {
    @State var selectedTab : Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView()
                .tag(0)
                .tabItem {
                    Text(CommonWords.search)
                    Image(systemName: SFSymbols.magnifyingglass)
                }
            
            FavoritesList()
                .tag(1)
                .tabItem {
                    Text(CommonWords.favorites)
                    Image(systemName: SFSymbols.star)
                }
        }
        .tint(Color(uiColor: UIColor.systemGreen))
    }
}

#Preview {
    GFTabView()
}
