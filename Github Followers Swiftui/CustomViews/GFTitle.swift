//
//  GFTitle.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFTitle: View {
    @State var title : String = "title"
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.primary)
            .lineLimit(1)
            .minimumScaleFactor(0.9)
    }
}

#Preview {
    GFTitle()
}
