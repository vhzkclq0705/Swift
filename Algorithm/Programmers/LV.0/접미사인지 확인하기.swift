//
//  접미사인지 확인하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-21.
//

import Foundation

func 접미사인지확인하기() {
    func solution(_ my_string:String, _ is_suffix:String) -> Int {
        return my_string.hasSuffix(is_suffix) ? 1 : 0
    }
}
