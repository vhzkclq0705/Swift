//
//  배열의 원소만큼 추가하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 배열의원소만큼추가하기() {
    func solution(_ arr:[Int]) -> [Int] {
        return arr.reduce(into: []) { $0 += Array(repeating: $1, count: $1) }
        // return arr.flatMap { $0 }
    }
}
