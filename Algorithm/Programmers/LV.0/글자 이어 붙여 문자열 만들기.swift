//
//  글자 이어 붙여 문자열 만들기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-20.
//

import Foundation

func 글자이어붙여문자열만들기() {
    func solution(_ my_string:String, _ index_list:[Int]) -> String {
        let my_string = my_string.map { String($0) }
        return index_list.map { my_string[$0] }.joined()
    }
}
