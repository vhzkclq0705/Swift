//
//  배열 만들기 6.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func 배열만들기6() {
    func solution(_ arr:[Int]) -> [Int] {
        let arr = arr.reduce(into: (0, [Int]())) {
            if $0.1.isEmpty || (!$0.1.isEmpty && $0.1.last! != $1) { $0.1.append($1)}
            else { $0.1.removeLast() }
            $0.0 += 1
        }
        return arr.1.isEmpty ? [-1] : arr.1
    }
}
