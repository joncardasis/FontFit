//
//  UITextView+FontFit.swift
//  FontFit
//
//  Created by Jonathan Cardasis (C) on 5/1/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import UIKit


public extension UITextView {
    
    /**
     Autosizes `font` to the largest value where the text fills the `maxLines` provided.
     
     Depending on the bounds of the view, the actual number of lines occupied by the text may
     be less than the preferred amount provided.
     */
    func fitText(maxLines: UInt) {
        guard let text = text else { return }
        let font = self.font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        self.font = UIFont.fontFittingText(text, in: textBoundingBox.size, fontDescriptor: font.fontDescriptor, option: .preferredLineCount(maxLines))
    }
    
    /**
     Autosizes `font` to the largest value where the text can still be contained in the view's bounds.
     */
    func fitTextToBounds() {
        guard let text = text else { return }
        let font = self.font ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        self.font = UIFont.fontFittingText(text, in: textBoundingBox.size, fontDescriptor: font.fontDescriptor, option: .fillContainer)
    }
    
    private var textBoundingBox: CGRect {
        var textInsets: UIEdgeInsets = textContainerInset
        textInsets.left += textContainer.lineFragmentPadding
        textInsets.right += textContainer.lineFragmentPadding
        return bounds.inset(by: textInsets)
    }
}

