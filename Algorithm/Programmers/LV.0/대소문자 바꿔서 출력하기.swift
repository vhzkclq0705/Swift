//
//  대소문자 바꿔서 출력하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 대소문자바꿔서출력하기() {
    let s1 = readLine()!
    
    let ans = s1.map { char -> String in
        return char.isUppercase ? char.lowercased() : char.uppercased()
    }.joined(separator: "")
    
    print(ans)
}
