//
//  주사위 게임 2.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 주사위게임2() {
    func solution(_ a:Int, _ b:Int, _ c:Int) -> Int {
        switch Set([a, b, c]).count {
        case 1: return (a + b + c) * (a * a + b * b + c * c) * (a * a * a + b * b * b + c * c * c)
        case 2: return (a + b + c) * (a * a + b * b + c * c)
        default: return a + b + c
        }
    }
}
