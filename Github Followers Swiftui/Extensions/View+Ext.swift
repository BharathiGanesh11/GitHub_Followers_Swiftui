//
//  View+Ext.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

extension View
{
    func roundedRectWithStroke(cornerRadius : CGFloat , backgroundColor : Color , strokeColor : Color , strokeWidth : CGFloat) -> some View
    {
        self
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .stroke(strokeColor, lineWidth: strokeWidth)
            }
    }
}
