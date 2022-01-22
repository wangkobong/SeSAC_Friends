//
//  String++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/22.
//

import Foundation

extension String {
    func substring(fromIndex: Int, count: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        let endIndex = self.index(self.startIndex, offsetBy: fromIndex + count)
        let range = startIndex..<endIndex
        return String(self[range])
    }
}
