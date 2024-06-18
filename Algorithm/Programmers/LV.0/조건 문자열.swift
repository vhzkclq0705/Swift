//
//  조건 문자열.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-18.
//

import Foundation

func 조건문자열() {
    func solution(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
        if ineq == "<" {
            if eq == "=" { return n <= m ? 1 : 0 }
            else { return n < m ? 1 : 0 }
        } else {
            if eq == "=" { return n >= m ? 1 : 0 }
            else { return n > m ? 1 : 0 }
        }
    }
}
