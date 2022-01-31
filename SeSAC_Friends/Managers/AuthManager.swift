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
        let idToken = UserDefaults.standard.string(forKey: K.idToken) ?? ""
        let phoneNumber = UserDefaults.standard.string(forKey: K.phoneNumber) ?? ""
        let nickname = UserDefaults.standard.string(forKey: K.nickname) ?? ""
        let birthDate = UserDefaults.standard.string(forKey: K.birthDate) ?? ""
        let gender = UserDefaults.standard.integer(forKey: K.gender)
        let email = UserDefaults.standard.string(forKey: K.email) ?? ""
        let FCMtoken = UserDefaults.standard.string(forKey: K.FCMtoken) ?? ""
        print(idToken)
        print("FCMtoken \(FCMtoken)")
        let url = K.makeEndPoint("user")
        let header: HTTPHeaders = [
            "idtoken": idToken,
            "Content-Type": "application/x-www-form-urlencoded"
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
        let idToken = UserDefaults.standard.string(forKey: K.idToken) ?? ""
        print(K.idToken)
        print(idToken)
        let url = K.makeEndPoint("user/withdraw")
        let header: HTTPHeaders = [
            "idtoken": idToken
        ]

        AF.request(url, method: .post, headers: header)
            .validate(statusCode: 200...501)
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

    static func getUser(completion: @escaping (User?, Int?) -> Void) {
        let idToken = UserDefaults.standard.string(forKey: K.idToken) ?? ""
        let url = K.makeEndPoint("user")
        let header: HTTPHeaders = [
            "idtoken": idToken
        ]

        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200...501)
            .responseDecodable(of: User.self) { response in
                let code = response.response?.statusCode
                let user = response.value
                switch response.result {
                case .success:
                    print(response.value)
                    print(code)
                    completion(user, code)
                case .failure(let error):
                    print(error)
                    completion(nil, code)
                }
            }
    }
}
