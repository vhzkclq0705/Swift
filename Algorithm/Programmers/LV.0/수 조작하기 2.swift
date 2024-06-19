//
//  수 조작하기 2.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 수조작하기2() {
    func solution(_ numLog:[Int]) -> String {
        let d: [Int: String] = [1: "w", -1: "s", 10: "d", -10: "a"]
        return (1..<numLog.count).map { d[numLog[$0] - numLog[$0 - 1]]! }.joined()
    }
}
