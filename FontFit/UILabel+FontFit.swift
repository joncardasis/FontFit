//
//  UILabel+FontFit.swift
//  FontFit
//
//  Created by Jonathan Cardasis (C) on 4/26/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import UIKit

public extension UILabel {
    
    /**
     Autosizes `font` to the largest value where the text fills the `maxLines` provided.
     
     Depending on the bounds of the view, the actual number of lines occupied by the text may
     be less than the preferred amount provided.
     */
    func fitText(maxLines: UInt) {
        guard let text = text else { return }
        numberOfLines = 0
        self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .preferredLineCount(maxLines))
    }
    
    /**
     Autosizes `font` to the largest value where the text can still be contained in the view's bounds.
     */
    func fitTextToBounds() {
        guard let text = text else { return }
        numberOfLines = 0
        self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .fillContainer)
    }
}
