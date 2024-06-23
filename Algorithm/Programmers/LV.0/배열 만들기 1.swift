//
//  배열 만들기 1.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 배열만들기1() {
    func solution(_ n:Int, _ k:Int) -> [Int] {
        return stride(from: k, through: n, by: k).map { $0 }
    }
}
