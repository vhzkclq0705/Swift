//
//  조건 문자열.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-18.
//

import Foundation

func 조건문자열() {
    func solution(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
        switch (ineq + eq) {
        case ">=": return n >= m ? 1 : 0
        case ">!": return n > m ? 1 : 0
        case "<=": return n <= m ? 1 : 0
        case "<!": return n < m ? 1 : 0
        default: return 0
        }
    }
}
