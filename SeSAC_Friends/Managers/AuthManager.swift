//
//  AuthManager.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation
import Alamofire

class AuthManager {

    static func checkSignUp(token: String) {

        let url = "http://test.monocoding.com:35484/user"
        let header: HTTPHeaders = [
            "idtoken": token
        ]

        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseString { response in
            switch response.result {
            case.success(let value):
                print("value: \(value)")
                print("response: \(response)")
            case.failure(let error):
                print(error)
            }
        }
    }
}
