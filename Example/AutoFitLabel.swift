//
//  AutoFitLabel.swift
//  Example
//
//  Created by Jonathan Cardasis (C) on 4/26/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import UIKit
import FontFit

@IBDesignable
class AutoFitLabel: UILabel {
    
    /**
     Overrides the font size of the label, scaling text to best fit it's bounds.
     */
    @IBInspectable
    var adjustsFontToFitContainer: Bool = true {
        didSet { updateFontIfNeeded() }
    }
    
    /**
     Overrides the font size of the label, scaling text to fit the number of lines provided.
     */
    var autosizeFontToNumberOfLines: UInt? {
        didSet { updateFontIfNeeded() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateFontIfNeeded()
    }
    
    private func updateFontIfNeeded() {
        if let numberOfLines = autosizeFontToNumberOfLines {
            fitText(maxLines: numberOfLines)
        } else if adjustsFontToFitContainer {
            fitTextToBounds()
        }
    }
}
