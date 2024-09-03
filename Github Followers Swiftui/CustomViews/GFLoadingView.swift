//
//  GFLoadingView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 01/09/24.
//

import SwiftUI

struct GFLoadingView: View {
    var body: some View {
        ZStack
        {
            let width : CGFloat = Device.screenWidth * 0.2
            GFColors.systemBackground.opacity(0.3)
            VStack(spacing:15)
            {
                Images.logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: width)
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
            }
        }
    }
}

#Preview {
    GFLoadingView()
}
