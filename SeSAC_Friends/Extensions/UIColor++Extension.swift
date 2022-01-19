//
//  UIColor++Extension.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import Foundation
import UIKit

extension UIColor {

    public enum Colors: String {

        case black = "BrandBlack"
        case white = "BrandWhite"
        case green = "BrandGreen"
        case whiteGreen = "BrandWhitegreen"
        case yellowGreen = "BrandYellowgreen"
        case error = "Error"
        case Focus = "Focus"
        case Success = "Success"
        case gray1 = "BrandGray1"
        case gray2 = "BrandGray2"
        case gray3 = "BrandGray3"
        case gray4 = "BrandGray4"
        case gray5 = "BrandGray5"
        case gray6 = "BrandGray6"
        case gray7 = "BrandGray7"

    }

    static func brandColor(_ type: Colors) -> UIColor {

        return UIColor(named: "\(type.rawValue)")!
    }

}
