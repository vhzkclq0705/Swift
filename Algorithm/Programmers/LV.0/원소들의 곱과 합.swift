//
//  원소들의 곱과 합.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-19.
//

import Foundation

func 원소들의곱과합() {
    func solution(_ num_list:[Int]) -> Int {
        return num_list.reduce(1, *) < Int(pow(Double(num_list.reduce(0, +)), 2.0)) ? 1 : 0
    }
}
