//
//  세 개의 구분자.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 세개의구분자() {
    func solution(_ myStr:String) -> [String] {
        let myStr = myStr.split { ["a", "b", "c"].contains($0) }.map { String($0) }
        return myStr.isEmpty ? ["EMPTY"] : myStr
    }
}
