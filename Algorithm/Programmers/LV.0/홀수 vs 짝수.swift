//
//  홀수 vs 짝수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-25.
//

import Foundation

func 홀수vs짝수() {
    func solution(_ num_list:[Int]) -> Int {
        return num_list.enumerated().reduce(into: [0, 0]) {
            if $1.offset % 2 == 0 { $0[0] += $1.element }
            else { $0[1] += $1.element }
        }.max() as! Int
    }
}
