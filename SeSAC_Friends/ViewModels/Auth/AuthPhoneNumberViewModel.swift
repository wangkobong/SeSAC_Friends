//
//  AuthPhoneNumberViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/19.
//

import Foundation

class AuthPhoneNumberViewModel {

    var phoneNumber: Observable<String> = Observable("")

    public func startAuth() {
        print(phoneNumber.value)
    }
}
