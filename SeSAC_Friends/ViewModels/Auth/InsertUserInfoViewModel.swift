//
//  InsertNicknameViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/20.
//

import Foundation

class InsertUserInfoViewModel {
    var nickname: Observable<String> = Observable("")
    var birthDate: Observable<String> = Observable("")
    var gender: Observable<Int> = Observable(2)

}
