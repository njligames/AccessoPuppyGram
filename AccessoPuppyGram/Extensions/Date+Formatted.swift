//
//  Date+Formatted.swift
//  AccessoPuppyGram
//
//  Created by James Folk on 7/27/22.
//

import Foundation

extension Date {
    var puppyDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yy, h:mm a"
        return dateFormatter.string(from: self)
    }
}
