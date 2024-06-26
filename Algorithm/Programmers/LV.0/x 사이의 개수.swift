//
//  x 사이의 개수.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func x사이의개수() {
    func solution(_ myString:String) -> [Int] {
        return myString.components(separatedBy: "x").map { $0.count }
    }
}
