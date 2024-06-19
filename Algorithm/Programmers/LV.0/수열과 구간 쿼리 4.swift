//
//  수열과 구간 쿼리 4.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 수열과구간쿼리4() {
    func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
        return queries.reduce(into: arr) { arr, q in
            (q[0]...q[1]).filter { $0 % q[2] == 0 }.forEach { arr[$0] += 1 }
        }
    }
}
