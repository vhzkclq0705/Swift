//
//  덧셈식 출력하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 덧셈식출력하기() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])
    
    print("\(a) + \(b) = \(a + b)")
}
