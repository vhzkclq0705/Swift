//
//  Cacheable.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import Foundation

protocol Cacheable {
    func convertToKey(from url: URL) -> String
}

extension Cacheable {
    /// Change URL to key for caching
    func convertToKey(from url: URL) -> String{
        let s = url.absoluteString
        let key = String(stride(from: 0, to: s.count, by: 5).map {
            s[s.index(s.startIndex, offsetBy: $0)]
        })
        
        return key.replacingOccurrences(of: "/", with: "")
    }
}
