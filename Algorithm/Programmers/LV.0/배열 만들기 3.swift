//
//  배열 만들기 3.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 배열만들기3() {
    func solution(_ arr:[Int], _ intervals:[[Int]]) -> [Int] {
        return intervals.reduce([]) { $0 + arr[$1[0]...$1[1]] }
    }
}
