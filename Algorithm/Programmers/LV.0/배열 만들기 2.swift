//
//  배열 만들기 2.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 배열만들기2() {
    func solution(_ l:Int, _ r:Int) -> [Int] {
        return stride(from: l, through: r, by: 5).filter {
            String($0).allSatisfy { ["0", "5"].contains($0) }
        }
    }
}
