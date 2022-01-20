//
//  InserEmailViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation

class InsertCodeViewModel {
    var smsCode: Observable<String> = Observable("")

    public func sendSMSCode(completion: @escaping (Bool) -> Void) {
        guard smsCode.value != "" else { return }
        FirebaseManager.shared.verifyCode(smsCode: smsCode.value) { success in
            guard success else { return completion(false)  }
            completion(true)
        }
    }
}
