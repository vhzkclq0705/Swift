//
//  특정 문자열로 끝나는 가장 긴 문자열 찾기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 특정문자열로끝나는가장긴부분문자열찾기() {
    func solution(_ myString:String, _ pat:String) -> String {
        return String(myString.prefix(upTo: myString.range(of: pat, options: .backwards)!.upperBound))
    }
}
