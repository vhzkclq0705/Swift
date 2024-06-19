//
//  30804.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

// Silver 2 - 과일 탕후루
func bj30804() {
    let n = Int(readLine()!)!
    let fruits = readLine()!.split(separator: " ").compactMap { Int($0) }
    var counter = [Int: Int]()
    var left = 0
    var right = 0
    var ans = 0
    
    while right < n {
        counter[fruits[right], default: 0] += 1
        right += 1
        
        while counter.count > 2 {
            counter[fruits[left]]! -= 1
            if counter[fruits[left]]! == 0 {
                counter.removeValue(forKey: fruits[left])
            }
            left += 1
        }
        
        ans = max(ans, right - left)
    }
    
    print(ans)
}
