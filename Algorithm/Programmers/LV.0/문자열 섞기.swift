//
//  문자열 섞기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 문자열섞기() {
    func solution(_ str1:String, _ str2:String) -> String {
        return zip(str1, str2).map {
            "\($0)\($1)"
        }.joined()
    }
}
