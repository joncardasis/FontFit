//
//  TextSizingOption.swift
//  FontFit
//
//  Created by Jonathan Cardasis (C) on 4/26/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import Foundation

public enum TextSizingOption: Equatable {
    case preferredLineCount(UInt)
    case fillContainer
    
    public static func == (lhs: TextSizingOption, rhs: TextSizingOption) -> Bool {
        switch (lhs, rhs) {
        case (let .preferredLineCount(lines1), let .preferredLineCount(lines2)):
            return lines1 == lines2
        case (.fillContainer,.fillContainer):
            return true
        default:
            return false
        }
    }
}
