//
//  홀짝 구분하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 홀짝구분하기() {
    let a = Int(readLine()!)!
    
    print("\(a) is \(a % 2 == 0 ? "even" : "odd")")
}
