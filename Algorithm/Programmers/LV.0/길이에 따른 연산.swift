//
//  길이에 따른 연산.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 길이에따른연산() {
    func solution(_ num_list:[Int]) -> Int {
        return num_list.count > 10 ? num_list.reduce(0, +) : num_list.reduce(0, *)
    }
}
