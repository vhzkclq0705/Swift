//
//  접미사 배열.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-21.
//

import Foundation

func 접미사배열() {
    func solution(_ my_string:String) -> [String] {
        return (1...my_string.count).map { String(my_string.suffix($0)) }.sorted()
    }
}
