//
//  Constants.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/23.
//

import Foundation

struct K {
    static let baseURL = "http://test.monocoding.com:35484/"
    static let idToken = "authVerificationID"
    static let phoneNumber = "phoneNumber"
    static let nickname = "nickname"
    static let birthDate = "dateOfBirth"
    static let gender = "gender"
    static let email = "email"
    static let FCMtoken = "FCMToken"

    static func makeEndPoint(_ endPoint: String) -> String {
        return baseURL + endPoint
    }
}
