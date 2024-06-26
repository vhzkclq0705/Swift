//
//  5명씩.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func _5명씩() {
    func solution(_ names:[String]) -> [String] {
        return stride(from: 0, to: names.count, by: 5).map { names[$0] }
    }
}
