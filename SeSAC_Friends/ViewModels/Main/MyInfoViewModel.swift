//
//  MyInfoViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/31.
//

import Foundation

class MyInfoViewModel {

    var searchable: Observable<Int> = Observable(0)
    var ageMin: Observable<Int> = Observable(18)
    var ageMax: Observable<Int> = Observable(34)
    var gender: Observable<Int> = Observable(-1)
    var hobby: Observable<String> = Observable("")

    func updateInfo(completion: @escaping (Bool, Int?) -> Void) {

        print("검색가능 \(searchable.value), 최소나이 \(ageMin.value), 최대나이 \(ageMax.value), 젠더넘버 \(gender.value), 취미: \(hobby.value)")

        AuthManager.updateUser(searchable: searchable.value, ageMin: ageMin.value, ageMax: ageMax.value, gedner: gender.value, hobby: hobby.value) { success, statusCode in
            if success {
                print("성공 , \(statusCode)")
                completion(true, statusCode)
            } else {
                print("실패 , \(statusCode)")
                completion(false, statusCode)
            }
        }
    }

}
