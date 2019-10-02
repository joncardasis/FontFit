//
//  ViewController.swift
//  FontFit
//
//  Created by Jonathan Cardasis (C) on 4/26/19.
//  Copyright © 2019 Jonathan Cardasis (C). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: AutoFitLabel!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleLabel()
        label.text = "That which yields is not always weak."
    }
    
    private func styleLabel() {
        label.layer.cornerRadius = 6.0
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
    
    @IBAction func shrinkWidth(_ sender: Any) {
        labelWidthConstraint.constant -= 10
    }
    
    @IBAction func growWidth(_ sender: Any) {
        labelWidthConstraint.constant += 10
    }
    
    @IBAction func shrinkHeight(_ sender: Any) {
        labelHeightConstraint.constant -= 10
    }
    
    @IBAction func growHeight(_ sender: Any) {
        labelHeightConstraint.constant += 10
    }
}

