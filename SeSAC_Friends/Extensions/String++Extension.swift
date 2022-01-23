//
//  String++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/22.
//

import Foundation

extension String {
    enum ValidityType {
        case age
        case email
        case code
        case nickname
        case phoneNumber
    }

    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z.]{2,64}"
        case code = "[0-9]{6}"
        case nickname = ".{1,10}"
        case phoneNumber = "^01([0])([0-9]{3,4})([0-9]{4})$"
    }

    func substring(fromIndex: Int, count: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        let endIndex = self.index(self.startIndex, offsetBy: fromIndex + count)
        let range = startIndex..<endIndex
        return String(self[range])
    }

    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""

        switch validityType {
        case .age:
            regex = Regex.age.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .code:
            regex = Regex.code.rawValue
        case .nickname:
            regex = Regex.nickname.rawValue
        case .phoneNumber:
            regex = Regex.phoneNumber.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
