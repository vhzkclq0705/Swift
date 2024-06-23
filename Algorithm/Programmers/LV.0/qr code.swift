//
//  qr code.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func qrcode() {
    func solution(_ q:Int, _ r:Int, _ code:String) -> String {
        return code.enumerated()
            .filter { $0.offset % q == r }
            .map { String($0.element) }
            .joined()
    }
}
