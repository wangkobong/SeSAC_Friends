//
//  AuthPhoneNumberViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import Foundation

class AuthPhoneNumberViewModel {

    var phoneNumber: Observable<String> = Observable("")

    public func startAuth(completion: @escaping (Bool) -> Void) {
        guard phoneNumber.value != "" else { return }
        FirebaseManager.shared.startAuth(phoneNumber: "+82\(phoneNumber.value)") { success in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
