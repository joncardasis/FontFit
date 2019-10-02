//
//  UIFont+FontFit.swift
//  FontFit
//
//  Created by Jonathan Cardasis (C) on 4/26/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import UIKit

public extension UIFont {
    
    /**
     Provides the largest font which fits the text in the given bounds.
     */
    static func fontFittingText(_ text: String, in bounds: CGSize, fontDescriptor: UIFontDescriptor, option: TextSizingOption) -> UIFont? {
        let properBounds = CGRect(origin: .zero, size: bounds)
        let largestFontSize = Int(bounds.height)
        let constrainingBounds = CGSize(width: properBounds.width, height: CGFloat.infinity)
        
        let bestFittingFontSize: Int? = (1...largestFontSize).reversed().first(where: { fontSize in
            let font = UIFont(descriptor: fontDescriptor, size: CGFloat(fontSize))
            let currentFrame = text.boundingRect(with: constrainingBounds, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
            
            if properBounds.contains(currentFrame) {
                let currentFrameLineCount = Int(ceil(currentFrame.height / font.lineHeight))
                if case .preferredLineCount(let lineCount) = option, currentFrameLineCount > max(lineCount, 1) {
                    return false
                }
                return true
            }
            
            return false
        })
        
        guard let fontSize = bestFittingFontSize else { return nil }
        return UIFont(descriptor: fontDescriptor, size: CGFloat(fontSize))
    }
}
