//
//  수열과 구간 쿼리 3.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 수열과구간쿼리3() {
    func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
        return queries.reduce(into: arr) { $0.swapAt($1[0], $1[1]) }
    }
}
