//
//  MathKeyboard.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 06/06/2018
//  Copyright © 2018 Summer Studios. All rights reserved.
//
//  Note: This code was built by following this Tutorial  https://digitalleaves.com/blog/2016/12/custom-in-app-keyboards/
//

import UIKit

private var mathKeyboardDelegate: MathKeyboardDelegate? = nil

extension UITextField: MathKeyboardDelegate {
    
    // Public methods to set or unset a UITextField that adopts MathKeyboardDelegate as a NumericKeyboard.
    
    func setAsMathKeyboard(delegate: MathKeyboardDelegate?) {
        let mathKeyboard = MathKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: MathKeyboardRecommendedHeight))
        self.inputView = mathKeyboard
        mathKeyboardDelegate = delegate
        mathKeyboard.delegate = self
    }
    
    func unsetAsMathKeyboard() {
        if let mathKeyboard = self.inputView as? MathKeyboard {
            mathKeyboard.delegate = nil
        }
        self.inputView = nil
        mathKeyboardDelegate = nil
    }
    
    //Can extend with Additional button type function here e.g. formula
    
    internal func mathSymbolPressed(symbol: String) {
        self.text?.append(symbol)
        mathKeyboardDelegate?.mathSymbolPressed(symbol: symbol)
    }
}

