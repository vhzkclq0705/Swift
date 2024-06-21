//
//  문자열의 뒤의 n글자.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-21.
//

import Foundation

func 문자열의뒤의n글자() {
    func solution(_ my_string:String, _ n:Int) -> String {
        return String(my_string.suffix(n))
    }
}
