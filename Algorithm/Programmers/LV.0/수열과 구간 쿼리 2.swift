//
//  수열과 구간 쿼리 2.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 수열과구간쿼리2() {
    func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
        return queries.map {
            let (s, e, k) = ($0[0], $0[1], $0[2])
            return arr[s...e].filter { $0 > k }.min() ?? -1
        }
    }
}
