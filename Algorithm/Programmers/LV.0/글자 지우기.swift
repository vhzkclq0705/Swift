//
//  글자 지우기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 글자지우기() {
    func solution(_ my_string:String, _ indices:[Int]) -> String {
        return my_string.enumerated()
            .filter { !indices.contains($0.offset) }
            .map { String($0.element) }
            .joined()
    }
}
