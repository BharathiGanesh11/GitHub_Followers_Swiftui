//
//  GFInfoView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 03/09/24.
//

import SwiftUI

enum InfoItemType
{
    case repos
    case gists
    case followers
    case following
    
    var title : String
    {
        switch self {
        case .repos:
            return "Public Repos"
        case .gists:
            return "Public Gists"
        case .followers:
            return "Followers"
        case .following:
            return "Following"
        }
    }
    
    var icon : String
    {
        switch self {
        case .repos:
            return  SFSymbols.repos
        case .gists:
            return  SFSymbols.gists
        case .followers:
            return  SFSymbols.followers
        case .following:
            return  SFSymbols.following
        }
    }
}

struct GFInfoView: View {
    @State var icon : String
    @State var title : String
    @State var count : Int
    var body: some View {
        VStack(spacing:10)
        {
            HStack(alignment:.center , spacing: 8)
            {
                Image(systemName: icon)
                Text(title)
                    .lineLimit(1)
            }
            .font(.headline)
            
            Text("\(count)")
                .lineLimit(1)
                .font(.headline)
        }
    }
}

#Preview {
    GFInfoView(icon: "folder", title: "Public Repos", count: 45)
}
