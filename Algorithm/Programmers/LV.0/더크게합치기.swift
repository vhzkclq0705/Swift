//
//  더크게합치기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-17.
//

import Foundation

func 더크게합치기() {
    func solution(_ a:Int, _ b:Int) -> Int {
        return max(Int("\(a)\(b)")!, Int("\(b)\(a)")!)
    }
}
