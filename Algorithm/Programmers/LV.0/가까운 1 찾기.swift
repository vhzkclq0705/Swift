//
//  가까운 1 찾기.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-23.
//

import Foundation

func 가까운1찾기() {
    func solution(_ arr:[Int], _ idx:Int) -> Int {
        return arr[idx...].firstIndex(of: 1) ?? -1
    }
}
