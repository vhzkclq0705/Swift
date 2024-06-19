//
//  코드 처리하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-18.
//

import Foundation

func 코드처리하기() {
    func solution(_ code:String) -> String {
        let code = code.map { String($0) }
        var ret = ""
        var mode = false
        
        for i in 0..<code.count {
            if (code[i] != "1") && ((!mode && (i % 2 == 0)) || (mode && (i % 2 == 1))) {
                ret += code[i]
            } else if code[i] == "1" {
                mode.toggle()
            }
        }
        
        return ret.isEmpty ? "EMPTY" : ret
    }
}
