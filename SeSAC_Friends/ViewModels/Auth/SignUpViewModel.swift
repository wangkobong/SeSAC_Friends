//
//  InsertNicknameViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation

class SignUpViewModel {

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
