//
//  GFTextField.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFTextField: View {
    @State var placeHolder : String = "Name"
    @Binding var value : String
    var body: some View {
        TextField(placeHolder, text: $value)
            .font(.title2)
            .fontDesign(.serif)
            .fontWeight(.semibold)
            .foregroundStyle(.primary)
            .multilineTextAlignment(.center)
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: UIColor.tertiarySystemBackground))
                    .stroke(GFColors.borderColor, lineWidth: 2.5)
            }
    }
}

#Preview {
    GFTextField(value: .constant(""))
        .padding()
}
