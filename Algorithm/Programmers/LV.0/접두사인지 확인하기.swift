//
//  접두사인지 확인하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 접두사인지확인하기() {
    func solution(_ my_string:String, _ is_prefix:String) -> Int {
        return my_string.hasPrefix(is_prefix) ? 1 : 0
    }
}
