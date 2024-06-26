//
//  ad 제거하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func ad제거하기() {
    func solution(_ strArr:[String]) -> [String] {
        return strArr.filter { !$0.contains("ad") }
    }
}
