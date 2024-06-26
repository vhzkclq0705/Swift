//
//  조건에 맞게 수열 변환하기 1.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 조건에맞게수열변환하기1() {
    func solution(_ arr:[Int]) -> [Int] {
        return arr.map {
            if $0 >= 50 && $0 % 2 == 0 { return $0 / 2 }
            else if $0 < 50 && $0 % 2 == 1 { return $0 * 2 }
            return $0
        }
    }
}
