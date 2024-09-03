//
//  GFButton.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFButton: View {
    @State var btnTitle : String = "Button Title"
    @State var backgroundColor : Color = .green
    @State var action : (() -> ())
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(btnTitle)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
        })
        
    }
}

#Preview {
    GFButton {
        
    }
}
