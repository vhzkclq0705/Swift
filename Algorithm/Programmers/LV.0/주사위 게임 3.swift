//
//  주사위 게임 3.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-20.
//

import Foundation

func 주사위게임3() {
    func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
        let d = [a, b, c, d].reduce(into: [:]) { arr, element in
            arr[element, default: 0] += 1
        }.sorted(by: { $0.value > $1.value })
        
        switch d.count {
        case 1: return 1111 * a
        case 2: return d[0].value == d[1].value ? (d[0].key + d[1].key) * abs(d[0].key - d[1].key) : Int(pow(Double(10 * d[0].key + d[1].key), 2.0))
        case 3: return d.dropFirst().reduce(1) { $0 * $1.key }
        default: return d.sorted(by: <).first!.key
        }
    }
}
