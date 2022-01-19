//
//  UIFont++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import UIKit

extension UIFont {

    public enum NotoSansType: String {

        case regular = "-Regular"
        case medium = "-Medium"
    }

    static func NotoSans(_ type: NotoSansType, size: CGFloat = UIFont.systemFontSize) -> UIFont {

        return UIFont(name: "NotoSansKR\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
