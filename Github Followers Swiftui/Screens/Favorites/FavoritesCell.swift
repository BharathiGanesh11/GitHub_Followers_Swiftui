//
//  FavoritesCell.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 04/09/24.
//

import SwiftUI

struct FavoritesCell: View {
    @State var favorite : Follower
    var body: some View {
        let width = Device.screenWidth * 0.15
        VStack
        {
            HStack
            {
                GFImageView(urlStr: $favorite.avatarUrl)
                    .frame(width: width, height: width)
                
                Text(favorite.login)
                    .font(.title)
                    .fontWeight(.semibold)
                    .fontDesign(.monospaced)
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
                    .truncationMode(.tail)
                    .padding(.leading ,15)
            }
        }
    }
}

#Preview {
    FavoritesCell(favorite: Follower(login: "sallen0400", avatarUrl: ""))
}
