//
//  AuthPhoneNumberViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import Foundation

class AuthPhoneNumberViewModel {

    var phoneNumber: Observable<String> = Observable("")

    public func startAuth(completion: @escaping (Bool, String?) -> Void) {
        guard phoneNumber.value != "" else { return }
        FirebaseManager.shared.startAuth(phoneNumber: "+82\(phoneNumber.value)") { success in
            if success {
                completion(true, "+82\(self.phoneNumber.value)")
            } else {
                completion(false, "+82\(self.phoneNumber.value)")
            }
        }
    }

    public func reRequestAuth(completion: @escaping (Bool, String?) -> Void) {
        guard phoneNumber.value != "" else { return }
        FirebaseManager.shared.reRequestAuth { success in
            if success {
                completion(true, "+82\(self.phoneNumber.value)")
            } else {
                completion(false, "+82\(self.phoneNumber.value)")
            }
        }
    }
}
