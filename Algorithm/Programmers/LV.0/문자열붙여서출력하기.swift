//
//  문자열붙여서출력하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 문자열붙여서출력하기() {
    let inp = readLine()!.components(separatedBy: [" "]).map { $0 }
    let (s1, s2) = (inp[0], inp[1])
    
    print(s1 + s2)
}
