//
//  할 일 목록.swift
//  Algorithm
//
//  Created by 권오준 on 2024-06-26.
//

import Foundation

func 할일목록() {
    func solution(_ todo_list:[String], _ finished:[Bool]) -> [String] {
        return todo_list.enumerated().filter { finished[$0.offset] == false }.map { $0.element }
    }
}
