//
//  String+Ext.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import Foundation

extension String
{
    func convertToDate() -> Date?
    {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = .current
        return df.date(from: self)
    }
    
    func convertToGFDateFormat() -> String
    {
        guard let date = self.convertToDate() else { return "N/A" }
        return "Github Since " + date.convertDateToMonthAndYearFormat()
    }
}
