//
//  문자열 겹쳐쓰기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 문자열겹쳐쓰기() {
    func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
        var ans = my_string
        let start = ans.index(ans.startIndex, offsetBy: s)
        let end = ans.index(start, offsetBy: overwrite_string.count)
        let range = start..<end
        
        ans.replaceSubrange(range, with: overwrite_string)
        return ans
    }
}
