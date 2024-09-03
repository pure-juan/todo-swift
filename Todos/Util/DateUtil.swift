//
//  DateUtil.swift
//  Todos
//
//  Created by 찌오 on 9/2/24.
//

import Foundation

extension Date {
    func startOfDate() -> Date {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = .current
        return cal.startOfDay(for: self)
    }
    
    func endOfDate() -> Date {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: self.startOfDate())!
        return Calendar.current.date(byAdding: .second, value: -1, to: modifiedDate)!
    }
    
    func tomorrow() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!.startOfDate()
    }
}
