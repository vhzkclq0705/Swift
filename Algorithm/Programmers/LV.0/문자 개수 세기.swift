//
//  문자 개수 세기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 문자개수세기() {
    func solution(_ my_string:String) -> [Int] {
        var alphabets = (Array(65...90) + Array(97...122)).reduce(into: [Character: Int]()) {
            $0[Character(UnicodeScalar($1)!)] = 0
        }
        
        my_string.forEach {
            alphabets[$0]! += 1
        }
        
        return alphabets.sorted(by: <).map { $0.value }
    }
}
