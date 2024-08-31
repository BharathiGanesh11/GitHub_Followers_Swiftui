//
//  Date+Ext.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import Foundation

extension Date
{
    func convertDateToMonthAndYearFormat() -> String {
        let df = DateFormatter()
        df.dateFormat = "MMM yyyy"
        return df.string(from: self)
    }
}
