//
//  n의 배수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func n의배수() {
    func solution(_ num:Int, _ n:Int) -> Int {
        return num % n == 0 ? 1 : 0
    }
}
