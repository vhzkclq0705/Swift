//
//  2의 영역.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func _2의영역() {
    func solution(_ arr:[Int]) -> [Int] {
        if let first = arr.firstIndex(of: 2),
           let last = arr.lastIndex(of: 2) {
            return Array(arr[first...last])
        }
        return [-1]
    }
}
