//
//  A 강조하기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func A강조하기() {
    func solution(_ myString:String) -> String {
        return myString.lowercased().replacingOccurrences(of: "a", with: "A")
    }
}
