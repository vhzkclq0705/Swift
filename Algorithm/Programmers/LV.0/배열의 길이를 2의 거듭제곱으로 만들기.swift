//
//  배열의 길이를 2의 거듭제곱으로 만들기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 배열의길이를2의거듭제곱으로만들기() {
    func solution(_ arr:[Int]) -> [Int] {
        return arr + Array(repeating: 0, count: Int(pow(2.0, ceil(log2(Double(arr.count))))) - arr.count)
    }
}
