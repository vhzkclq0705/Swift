//
//  1로 만들기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func _1로만들기() {
    func solution(_ num_list:[Int]) -> Int {
        var num_list = num_list
        var i = 0
        var ans = 0

        while num_list.reduce(0, +) != num_list.count {
            while num_list[i] != 1 {
                if num_list[i] % 2 == 1 { num_list[i] -= 1 }
                num_list[i] /= 2
                ans += 1
            }
            i = min(num_list.count - 1, i + 1)
        }

        return ans
    }
}
