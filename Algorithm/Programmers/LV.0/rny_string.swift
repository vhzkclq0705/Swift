//
//  rny_string.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-27.
//

import Foundation

func rny_string() {
    func solution(_ rny_string:String) -> String {
        return rny_string.replacingOccurrences(of: "m", with: "rn")
    }
}
