//
//  UISearchBarCustomKb.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 4/6/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

private var numericKeyboardDelegate: NumericKeyboardDelegate? = nil

extension UISearchBar: NumericKeyboardDelegate {
    // MARK: - Public methods to set or unset this uitextfield as NumericKeyboard.
    
    func setAsNumericKeyboard(delegate: NumericKeyboardDelegate?) {
        let numericKeyboard = NumericKeyboard(frame: CGRect(x: 0, y: 0, width: 0, height: kDLNumericKeyboardRecommendedHeight))
        self.inputAccessoryView = numericKeyboard
        numericKeyboardDelegate = delegate
        numericKeyboard.delegate = self
    }
    
    func unsetAsNumericKeyboard() {
        if let numericKeyboard = self.inputView as? NumericKeyboard {
            numericKeyboard.delegate = nil
        }
        self.inputAccessoryView = nil
        numericKeyboardDelegate = nil
    }
    
    // MARK: - NumericKeyboardDelegate methods
    
    internal func numericKeyPressed(key: Int) {
        self.text?.append("\(key)")
        numericKeyboardDelegate?.numericKeyPressed(key: key)
    }
    
    internal func numericBackspacePressed() {
        if var text = self.text, text.characters.count > 0 {
            _ = text.remove(at: text.index(before: text.endIndex))
            self.text = text
        }
        numericKeyboardDelegate?.numericBackspacePressed()
    }
    
    internal func numericSymbolPressed(symbol: String) {
        self.text?.append(symbol)
        numericKeyboardDelegate?.numericSymbolPressed(symbol: symbol)
    }
}

