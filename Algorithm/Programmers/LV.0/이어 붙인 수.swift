//
//  이어 붙인 수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 이어붙인수() {
    func solution(_ num_list:[Int]) -> Int {
        let even = Int(num_list.reduce("") { $0 + ($1 % 2 == 0 ? String($1) : "") })!
        let odd = Int(num_list.reduce("") { $0 + ($1 % 2 != 0 ? String($1) : "") })!
        
        return even + odd
    }
}
