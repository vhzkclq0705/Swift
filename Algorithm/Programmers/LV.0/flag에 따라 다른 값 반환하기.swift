//
//  flag에 따라 다른 값 반환하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-18.
//

import Foundation

func flag에따라다른값반환하기() {
    func solution(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
        return flag ? a + b : a - b
    }
}
