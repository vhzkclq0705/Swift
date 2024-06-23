//
//  배열 조각하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 배열조각하기() {
    func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
        var left = 0, right = query.count - 1
        query.enumerated().forEach {
            if $0.offset % 2 == 0 { right = left + $0.element }
            else { left += $0.element }
        }
        
        return Array(arr[left...right])
    }
}
