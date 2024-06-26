//
//  조건에 맞게 수열 변환하기 2.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 조건에맞게수열변환하기2() {
    func solution(_ arr:[Int]) -> Int {
        var arr = arr
        var x = 0
        
        while true {
            let tmp: [Int] = arr.map {
                if $0 >= 50 && $0 % 2 == 0 { return $0 / 2 }
                else if $0 < 50 && $0 % 2 == 1 { return $0 * 2 + 1 }
                return $0
            }
            if arr == tmp { break }
            arr = tmp
            
            x += 1
        }
        
        return x
    }
}
