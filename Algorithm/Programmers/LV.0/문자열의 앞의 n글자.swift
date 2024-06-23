//
//  문자열의 앞의 n글자.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 문자열의앞의n글자() {
    func solution(_ my_string:String, _ n:Int) -> String {
        return String(my_string.prefix(n))
    }
}
