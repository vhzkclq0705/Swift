//
//  9로 나눈 나머지.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-20.
//

import Foundation

func 구로나눈나머지() {
    func solution(_ number:String) -> Int {
        return number.map { Int(String($0))! }.reduce(0, +) % 9
    }
}
