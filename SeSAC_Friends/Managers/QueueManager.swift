//
//  QueueManager.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/09.
//

import Foundation
import Alamofire

class QueueManager {

    static func getRegion(lat: Double, long: Double) -> String {

        var latString = String(format: "%.2f", lat)
        let latNumber = Int((Double(latString)! + 90) * 100)
        latString = String(latNumber)

        var longString = String(format: "%.2f", long)
        let longNumber = Int((Double(longString)! + 180) * 100)
        longString = String(longNumber)

        return latString + longString
    }

    static func onqueue(lat: Double, long: Double, region: Int) {

    }
}
