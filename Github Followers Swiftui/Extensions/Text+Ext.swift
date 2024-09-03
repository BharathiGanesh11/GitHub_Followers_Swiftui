//
//  Text+Ext.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 03/09/24.
//

import SwiftUI

extension Text
{
    func normal(font : Font , foregroundColor : Color , lineLimit : Int) -> some View
    {
        self
            .font(font)
            .foregroundStyle(foregroundColor)
            .lineLimit(lineLimit)
            .truncationMode(.tail)
            .minimumScaleFactor(0.8)
            
    }
    
    func withWeight(font : Font , foregroundColor : Color , lineLimit : Int , weight : Font.Weight ) -> some View
    {
        self
            .font(font)
            .fontWeight(weight)
            .foregroundStyle(foregroundColor)
            .lineLimit(lineLimit)
            .truncationMode(.tail)
            .minimumScaleFactor(0.8)
            
    }
}
