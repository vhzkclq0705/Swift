//
//  왼쪽 오른쪽.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-25.
//

import Foundation

func 왼쪽오른쪽() {
    func solution(_ str_list:[String]) -> [String] {
        for (i, s) in str_list.enumerated() {
            if s == "l" { return Array(str_list[..<i]) }
            if s == "r" { return Array(str_list[(i + 1)...]) }
        }
        return []
    }
}
