//
//  InsertNicknameViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation

class SignUpViewModel {

    var idToken = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
    var phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    var nickname = UserDefaults.standard.string(forKey: "nickname") ?? ""
    var birthDate = UserDefaults.standard.string(forKey: "dateOfBirth") ?? ""
    var gender = UserDefaults.standard.integer(forKey: "gender")
    var email = UserDefaults.standard.string(forKey: "userEmail") ?? ""
    var FCMtoken = UserDefaults.standard.string(forKey: "FCMToken") ?? ""

    public func signUp(completion: @escaping (Bool, Int?) -> Void) {
        print(#function)
        AuthManager.signUp { success, code in
            if success {
                completion(true, code)
            } else {
                completion(false, code)
            }
        }
    }
}
