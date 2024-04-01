//
//  SelectedView.swift
//  FrameVSBounds
//
//  Created by 권오준 on 2024-04-01.
//

import UIKit

enum SelectedView {
    case firstView
    case secondView
}

extension SelectedView {
    var text: String {
        switch self {
        case .firstView: return "firstView"
        case .secondView: return "secondView"
        }
    }
    
    var color: UIColor {
        switch self {
        case .firstView: return .green
        case .secondView: return .blue
        }
    }
}
