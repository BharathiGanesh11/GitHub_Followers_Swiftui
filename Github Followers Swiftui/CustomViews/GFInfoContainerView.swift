//
//  GFInfoContainerView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 03/09/24.
//

import SwiftUI

struct GFInfoContainerView: View {
    var body: some View {
        let height = Device.screenWidth * 0.45
        RoundedRectangle(cornerRadius: 18)
            .fill(GFColors.secondarySysBackground)
            .frame(height: height)
    }
}

#Preview {
    GFInfoContainerView()
}
