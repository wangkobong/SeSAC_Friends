//
//  Queue.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/13.
//

import Foundation

// MARK: - Queue
struct Queue: Codable {
    let fromQueueDB: [FromQueueDB]
    let fromQueueDBRequested: [FromQueueDB]
    let fromRecommend: [String]
}

// MARK: - FromQueueDB
struct FromQueueDB: Codable {
    let hf, reviews: [String]
    let reputation: [Int]
    let uid, nick: String
    let gender, type, sesac, background: Int
    let long, lat: Double
}
