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
    }

    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z.]{2,64}"
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
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
