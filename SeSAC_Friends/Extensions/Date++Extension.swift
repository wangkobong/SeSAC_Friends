//
//  Date++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/22.
//

import Foundation

extension Date {

    func dateToString(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "ko_KR")
        dateformatter.timeZone = TimeZone(abbreviation: "KST")
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: date)
    }

    func getAge(birthDay: Date) -> Int {
        let timeInterval = birthDay.timeIntervalSinceNow
        let age = abs(Int(timeInterval / 31556926.0))
        return age
    }
}
