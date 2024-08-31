//
//  GFBody.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFBody: View {
    @State var title : String = "body"
    var body: some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    GFBody()
}
