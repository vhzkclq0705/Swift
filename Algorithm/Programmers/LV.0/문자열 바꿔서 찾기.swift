//
//  문자열 바꿔서 찾기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 문자열바꿔서찾기() {
    func solution(_ myString:String, _ pat:String) -> Int {
        return myString.map { $0 == "A" ? "B" : "A" }.joined().contains(pat) ? 1 : 0
    }
}
