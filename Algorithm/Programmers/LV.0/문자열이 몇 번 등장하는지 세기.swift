//
//  문자열이 몇 번 등장하는지 세기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 문자열이몇번등장하는지세기() {
    func solution(_ myString:String, _ pat:String) -> Int {
        var ans = 0
        
        for i in 0...(myString.count - pat.count) {
            if String(Array(myString)[i..<(i + pat.count)]) == pat { ans += 1 }
        }
        
        return ans
    }
}
