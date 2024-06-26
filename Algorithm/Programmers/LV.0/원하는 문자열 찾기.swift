//
//  원하는 문자열 찾기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 원하는문자열찾기() {
    func solution(_ myString:String, _ pat:String) -> Int {
        return myString.uppercased().contains(pat.uppercased()) ? 1 : 0
    }
}
