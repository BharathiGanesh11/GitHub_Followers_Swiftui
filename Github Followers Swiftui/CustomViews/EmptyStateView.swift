//
//  EmptyStateView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 04/09/24.
//

import SwiftUI

struct EmptyStateView: View {
    @State var title : String = "Empty State View"
    var body: some View {
        let height = Device.screenHeight * 0.6
        let width = Device.screenWidth * 0.5
        VStack
        {
            Spacer()
            
            Text(title)
                .withWeight(font: .title, foregroundColor: .secondary, lineLimit: 2, weight: .semibold)
                .padding(.horizontal , 12)
            
            Images.emptyState
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    EmptyStateView()
}
