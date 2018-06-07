//
//  MathKeyboard.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 06/06/2018
//  Copyright © 2018 Summer Studios. All rights reserved.
//
//  Note: This code was built by referencing this Tutorial  https://digitalleaves.com/blog/2016/12/custom-in-app-keyboards/
//

import UIKit

private var mathKeyboardDelegate: MathKeyboardDelegate? = nil

extension UITextField: MathKeyboardDelegate {
    
    // Public methods to set or unset a UITextField that adopts MathKeyboardDelegate as a MathKeyboard.
    
    func setAsMathKeyboard(delegate: MathKeyboardDelegate?) {
        let mathKeyboard = MathKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: MathKeyboardRecommendedHeight))
        self.inputAccessoryView = mathKeyboard
        mathKeyboardDelegate = delegate
        mathKeyboard.delegate = self
    }
    
    func unsetAsMathKeyboard() {
        if let mathKeyboard = self.inputAccessoryView as? MathKeyboard {
            mathKeyboard.delegate = nil
        }
        self.inputAccessoryView = nil
        mathKeyboardDelegate = nil
    }
    
    //Can extend with Additional button type function here e.g. formula
    
    
    internal func mathSymbolPressed(symbol: String) {               //handle symbol button being pressed
        self.text?.append(symbol)                                   // further IBActions for new button types can be added below here
        mathKeyboardDelegate?.mathSymbolPressed(symbol: symbol)
    }
}

