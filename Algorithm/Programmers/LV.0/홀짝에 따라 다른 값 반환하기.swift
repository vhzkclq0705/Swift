//
//  홀짝에 따라 다른 값 반환하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 홀짝에따라다른값반환하기() {
    func isEven(_ n: Int) -> Bool {
        return n % 2 == 0
    }
    
    func solution1(_ n:Int) -> Int {
        var sumOfEvenNumbers = 0
        var sumOfOddNumbers = 0
        
        for i in 1...n {
            if isEven(i) { sumOfEvenNumbers += i * i }
            else { sumOfOddNumbers += i }
        }
        
        return isEven(n) ? sumOfEvenNumbers : sumOfOddNumbers
    }
    
    // stride 사용
    func solution2(_ n: Int) -> Int {
        if n % 2 == 0 { return stride(from: 2, through: n, by: 2).reduce(0) { $0 + $1 * $1 } }
        else { return stride(from: 1, through: n, by: 2).reduce(0, +) }
    }
}
