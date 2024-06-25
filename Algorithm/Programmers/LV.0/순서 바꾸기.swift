//
//  순서 바꾸기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-25.
//

import Foundation

func 순서바꾸기() {
    func solution(_ num_list:[Int], _ n:Int) -> [Int] {
        return Array(num_list[n...]) + Array(num_list[..<n])
    }
}
