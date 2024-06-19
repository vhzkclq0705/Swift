//
//  마지막 두 원소.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 마지막두원소() {
    func solution(_ num_list:[Int]) -> [Int] {
        let a = num_list.last!
        let b = num_list[num_list.count - 2]
        return num_list + [a > b ? a - b : a * 2]
    }
}
