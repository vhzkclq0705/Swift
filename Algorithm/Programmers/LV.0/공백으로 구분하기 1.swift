//
//  공백으로 구분하기 1.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 공백으로구분하기() {
    func solution(_ my_string:String) -> [String] {
        return my_string.components(separatedBy: " ")
    }
}
