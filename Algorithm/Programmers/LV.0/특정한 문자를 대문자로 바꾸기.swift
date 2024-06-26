//
//  특정한 문자를 대문자로 바꾸기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 특정한문자를대문자로바꾸기() {
    func solution(_ my_string:String, _ alp:String) -> String {
        return my_string.replacingOccurrences(of: alp, with: alp.uppercased())
    }
}
