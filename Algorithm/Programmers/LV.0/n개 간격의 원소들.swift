//
//  n개 간격의 원소들.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-25.
//

import Foundation

func n개간격의원소들() {
    func solution(_ num_list:[Int], _ n:Int) -> [Int] {
        return stride(from: 0, to: num_list.count, by: n).map { num_list[$0] }
    }
}
