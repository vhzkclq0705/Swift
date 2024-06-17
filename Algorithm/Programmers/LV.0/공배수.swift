//
//  공배수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 공배수() {
    func solution(_ number:Int, _ n:Int, _ m:Int) -> Int {
        return number % n == 0 && number % m == 0 ? 1 : 0
    }
}
