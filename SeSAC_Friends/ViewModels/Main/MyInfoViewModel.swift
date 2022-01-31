//
//  MyInfoViewModel.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/31.
//

import Foundation

class MyInfoViewModel {

    var searchable: Observable<Int> = Observable(1)
    var ageMin: Observable<Int> = Observable(18)
    var ageMax: Observable<Int> = Observable(34)
    var gender: Observable<Int> = Observable(-1)
    var hobby: Observable<String> = Observable("")

}
