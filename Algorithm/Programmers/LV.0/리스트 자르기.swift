//
//  리스트 자르기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 리스트자르기() {
    func solution(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
        switch n {
        case 1: return Array(num_list[...slicer[1]])
        case 2: return Array(num_list[slicer[0]...])
        case 3: return Array(num_list[slicer[0]...slicer[1]])
        default: return stride(from: slicer[0], through: slicer[1], by: slicer[2]).map { num_list[$0] }
        }
    }
}
