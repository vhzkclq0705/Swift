//
//  문자열 뒤집기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 문자열뒤집기() {
    func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
        var my_string = Array(my_string)
        my_string.replaceSubrange(s...e, with: my_string[s...e].reversed())
        
        return String(my_string)
    }
}
