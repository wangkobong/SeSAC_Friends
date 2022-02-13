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

    static func onqueue(lat: Double, long: Double, region: Int, completion: @escaping (Queue?, Int?) -> Void) {
        let idToken = UserDefaults.standard.string(forKey: K.idToken) ?? ""
        let url = K.makeEndPoint("queue/onqueue")

        let body: Parameters = [
            "region": region,
            "lat": lat,
            "long": long
        ]

        let header: HTTPHeaders = [
            "idtoken": idToken
        ]

        AF.request(url, method: .post, parameters: body, headers: header)
            .validate(statusCode: 200...501)
            .responseDecodable(of: Queue.self) { response in
                let code = response.response?.statusCode
                let otherUSer = response.value
                switch response.result {
                case .success:
                    print(response.value)
                    print(code)
                    completion(otherUSer, code)
                case .failure(let error):
                    print(error)
                    completion(nil, code)
                }
            }

    }
}
