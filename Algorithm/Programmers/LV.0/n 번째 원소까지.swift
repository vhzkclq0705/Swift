//
//  n 번째 원소까지.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-25.
//

import Foundation

func n번째원소까지() {
    func solution(_ num_list:[Int], _ n:Int) -> [Int] {
        return Array(num_list.prefix(n))
    }
}
