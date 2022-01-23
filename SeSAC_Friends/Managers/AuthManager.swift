//
//  AuthManager.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation
import Alamofire

class AuthManager {

    static func checkSignUp(token: String, completion: @escaping (Bool, Int?) -> Void) {

        let url = K.makeEndPoint("user")
        let header: HTTPHeaders = [
            K.idToken: token
        ]

        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseString { response in
            switch response.result {
            case.success:
                let code = response.response?.statusCode
                completion(true, code)
            case.failure(let error):
                print(error)
                let code = response.response?.statusCode
                completion(false, code)
            }
        }
    }

    static func signUp(completion: @escaping (Bool, Int?) -> Void) {
        let idToken = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
        let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
        let nickname = UserDefaults.standard.string(forKey: "nickname") ?? ""
        let birthDate = UserDefaults.standard.string(forKey: "dateOfBirth") ?? ""
        let gender = UserDefaults.standard.integer(forKey: "gender")
        let email = UserDefaults.standard.string(forKey: "userEmail") ?? ""
        let FCMtoken = UserDefaults.standard.string(forKey: "FCMToken") ?? ""
        print(idToken)
        print("FCMtoken \(FCMtoken)")
        let url = K.makeEndPoint("user")
        let header: HTTPHeaders = [
            K.idToken: idToken
        ]
        let body: Parameters = [
            "phoneNumber": phoneNumber,
            "FCMtoken": FCMtoken,
            "nick": nickname,
            "birth": birthDate,
            "email": email,
            "gender": gender
        ]

        AF.request(url, method: .post, parameters: body, headers: header)
            .validate(statusCode: 200...500)
            .responseString { response in
                let code = response.response?.statusCode
                switch response.result {
                case .success:
                    print(response.value)
                    print(code)
                    completion(true, code)
                case .failure(let error):
                    print(error)
                    completion(false, code)
                }
            }
    }

    static func withdraw(completion: @escaping (Bool, Int?) -> Void) {
        let idToken = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
        let url = K.makeEndPoint("user/withdraw")
        let header: HTTPHeaders = [
            K.idToken: idToken
        ]

        AF.request(url, method: .post, headers: header)
            .validate(statusCode: 200...500)
            .responseString { response in
                let code = response.response?.statusCode
                switch response.result {
                case .success:
                    print(response.value)
                    print(code)
                    completion(true, code)
                case .failure(let error):
                    print(error)
                    completion(false, code)
                }
            }
    }
}
