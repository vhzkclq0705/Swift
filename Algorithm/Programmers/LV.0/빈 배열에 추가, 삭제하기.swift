//
//  빈 배열에 추가, 삭제하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 빈배열에추가삭제하기() {
    func solution(_ arr:[Int], _ flag:[Bool]) -> [Int] {
        return flag.enumerated().reduce(into: []) {
            if $1.element { $0 += Array(repeating: arr[$1.offset], count: arr[$1.offset] * 2) }
            else { $0 = Array($0.prefix($0.count - arr[$1.offset])) }
        }
    }
}
