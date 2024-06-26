//
//  n보다 커질 때까지 더하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func n보다커질때까지더하기() {
    func solution(_ numbers:[Int], _ n:Int) -> Int {
        return numbers.reduce(0) { $0 > n ? $0 : $0 + $1 }
    }
}
