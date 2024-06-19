//
//  수 조작하기 1.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 수조작하기1() {
    func solution(_ n:Int, _ control:String) -> Int {
        let dict: [Character : Int] = ["w": 1, "s": -1, "d": 10, "a": -10]
        return n + control.reduce(0) { $0 + dict[$1]! }
    }
}
