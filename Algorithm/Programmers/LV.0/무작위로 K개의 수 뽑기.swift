//
//  무작위로 K개의 수 뽑기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 무작위로K개의수뽑기() {
    func solution(_ arr:[Int], _ k:Int) -> [Int] {
        var s = Set<Int>()
        let arr = arr.reduce(into: [Int]()) {
            if !s.contains($1) { $0.append($1); s.insert($1) }
        }
        
        return arr.count >= k ? Array(arr[..<k]) : arr + Array(repeating: -1, count: k - arr.count)
    }
}
