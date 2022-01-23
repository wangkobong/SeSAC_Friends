//
//  User.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/23.
//

import Foundation

// MARK: - User
struct User: Codable {
    let phoneNumber, fcMtoken, nick, birth: String
    let email: String
    let gender: Int

    enum CodingKeys: String, CodingKey {
        case phoneNumber
        case fcMtoken = "FCMtoken"
        case nick, birth, email, gender
    }
}
