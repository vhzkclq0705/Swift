//
//  배열에서 문자열 대소문자 변환하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 배열에서문자열대소문자변환하기() {
    func solution(_ strArr:[String]) -> [String] {
        return strArr.enumerated().map {
            if $0.offset % 2 == 1 { return $0.element.uppercased() }
            return $0.element.lowercased()
        }
    }
}
