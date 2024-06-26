//
//  수열과 구간 쿼리 1.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 수열과구간쿼리1(){
    func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
        return queries.reduce(into: arr) { arr, q in
            (q[0]...q[1]).forEach { arr[$0] += 1 }
        }
    }
}
