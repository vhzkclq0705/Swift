//
//  콜라츠 수열 만들기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-20.
//

import Foundation

func 콜라츠수열만들기() {
    func solution(_ n:Int) -> [Int] {
        var ans = [n]
            
        while ans.last! != 1 {
            ans.append(ans.last! % 2 == 0 ? ans.last! / 2 : 3 * ans.last! + 1)
        }
        
        return ans
    }
}
