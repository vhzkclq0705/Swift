//
//  등차수열의 특정한 항만 더하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 등차수열의특정한항만더하기() {
    func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
        return included.enumerated().reduce(0) { $0 + ($1.element ? a + d * $1.offset : 0) }
    }
}
