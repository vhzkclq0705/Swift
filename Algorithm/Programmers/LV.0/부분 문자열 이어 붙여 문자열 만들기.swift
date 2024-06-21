//
//  부분 문자열 이어 붙여 문자열 만들기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-21.
//

import Foundation

func 부분문자열이어붙여문자열만들기() {
    func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
        return (0..<my_strings.count).map { String(Array(my_strings[$0])[parts[$0][0]...parts[$0][1]]) }.joined()
    }
}
