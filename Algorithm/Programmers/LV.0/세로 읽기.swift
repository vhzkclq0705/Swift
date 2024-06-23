//
//  세로 읽기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 세로읽기() {
    func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
        return my_string.enumerated()
            .filter { $0.offset % m == c - 1 }
            .map { String($0.element) }
            .joined()
    }
}
