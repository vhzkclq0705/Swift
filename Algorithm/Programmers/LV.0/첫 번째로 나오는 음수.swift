//
//  첫 번째로 나오는 음수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 첫번째로나오는음수() {
    func solution(_ num_list:[Int]) -> Int {
        return num_list.firstIndex(where: { $0 < 0 }) ?? -1
    }
}
