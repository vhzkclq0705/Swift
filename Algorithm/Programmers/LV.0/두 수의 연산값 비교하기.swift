//
//  두 수의 연산값 비교하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 두수의연산값비교하기() {
    func solution(_ a:Int, _ b:Int) -> Int {
        return max(Int("\(a)\(b)")!, 2 * a * b)
    }
}
