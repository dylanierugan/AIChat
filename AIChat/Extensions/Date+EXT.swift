//
//  Date+EXT.swift
//  AIChat
//
//  Created by Dylan Ierugan on 8/15/25.
//

import Foundation

extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let totalSeconds =
            (days * 86_400) +
            (hours * 3_600) +
            (minutes * 60)
        return self.addingTimeInterval(TimeInterval(totalSeconds))
    }
}
