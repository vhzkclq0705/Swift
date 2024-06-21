//
//  배열 만들기 5.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-21.
//

import Foundation

func 배열만들기5() {
    func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
        return intStrs.map { Int(String(Array($0)[s..<s + l]))! }.filter { $0 > k }
    }
}
