//
//  DateFormat.swift
//  Todos
//
//  Created by 찌오 on 9/2/24.
//

import Foundation

class DateFormat {
    private init() { }
    
    public static var formatter: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }
    
    public static func format(date: Date) -> String {
        return DateFormat.formatter.string(from: date)
    }
}
