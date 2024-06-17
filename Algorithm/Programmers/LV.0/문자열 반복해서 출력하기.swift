//
//  문자열 반복해서 출력하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 문자열반복해서출력하기() {
    let inp = readLine()!.components(separatedBy: [" "]).map { $0 }
    let (s1, a) = (inp[0], Int(inp[1])!)
    
    print(String(repeating: s1, count: a))
}
