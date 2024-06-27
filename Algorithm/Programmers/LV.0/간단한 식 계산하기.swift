//
//  간단한 식 계산하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 간단한식계산하기() {
    func solution(_ binomial:String) -> Int {
        let arr = binomial.split(separator: " ").map { String($0) }
        
        switch arr[1] {
        case "+": return Int(arr[0])! + Int(arr[2])!
        case "-": return Int(arr[0])! - Int(arr[2])!
        default: return Int(arr[0])! * Int(arr[2])!
        }
    }
}
