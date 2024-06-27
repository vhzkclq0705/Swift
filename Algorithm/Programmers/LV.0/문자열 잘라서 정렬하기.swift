//
//  문자열 잘라서 정렬하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 문자열잘라서정렬하기() {
    func solution(_ myString:String) -> [String] {
        return myString.split(separator: "x").map { String($0) }.sorted()
    }
}
