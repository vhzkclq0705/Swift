//
//  n 번째 원소부터.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func n번째원소부터() {
    func solution(_ num_list:[Int], _ n:Int) -> [Int] {
        return Array(num_list[(n - 1)...])
    }
}
