//
//  DisplayResults.swift
//  PracticeCaching
//
//  Created by 권오준 on 2024-03-26.
//

import Foundation

/// Print what this app works
enum Works {
    case saveToMemory
    case loadFromMemory
    case saveToDisk
    case loadFromDisk
}

extension Works {
    
    static func displayResult(_ works: Works, _ name: String) {
        switch works {
        case .loadFromDisk: print("Load \(name) from Disk")
        case .loadFromMemory: print("Load \(name) from Memory")
        case .saveToDisk: print("Save \(name) to Disk")
        case .saveToMemory: print("Save \(name) to Memory")
        }
    }
    
}
