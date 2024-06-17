//
//  a와 b 출력하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func a와b출력하기() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    print("a = \(n[0])\nb = \(n[1])")
}
