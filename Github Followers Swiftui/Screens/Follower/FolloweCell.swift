//
//  FolloweCell.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 01/09/24.
//

import SwiftUI

struct FolloweCell: View {
    @Binding var follower : Follower
    var body: some View {
        VStack
        {
            GFImageView(urlStr: $follower.avatarUrl)
                .frame(width: 80, height: 80, alignment: .center)
                .clipShape(Circle())
            
            Text(follower.login)
                .font(.headline)
                .fontDesign(.some(.monospaced))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

#Preview {
    FolloweCell(follower: .constant(Follower(login: "Bharathi ganesh", avatarUrl: "")))
}
