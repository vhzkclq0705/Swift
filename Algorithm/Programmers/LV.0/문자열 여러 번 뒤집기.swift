//
//  문자열 여러 번 뒤집기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-20.
//

import Foundation

func 문자열여러번뒤집기() {
    func solution(_ my_string:String, _ queries:[[Int]]) -> String {
        var my_string = my_string.map { String($0) }
        queries.forEach {
            my_string[$0[0]...$0[1]].reverse()
        }
        
        return my_string.joined()
    }
}
