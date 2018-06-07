//
//  SubscriptMapping.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//
//  This file handles subscript mapping for dynamic formulas such as Summation / Product that require small letters

import Foundation

func valueToSubscript(valueToMap: String) -> String {
    
    var subscriptDictionary = [Character:Character]()
    subscriptDictionary["0"] = "₀"
    subscriptDictionary["1"] = "₁"
    subscriptDictionary["2"] = "₂"
    subscriptDictionary["3"] = "₃"
    subscriptDictionary["4"] = "₄"
    subscriptDictionary["5"] = "₅"
    subscriptDictionary["6"] = "₆"
    subscriptDictionary["7"] = "₇"
    subscriptDictionary["8"] = "₈"
    subscriptDictionary["9"] = "₉"
    subscriptDictionary["+"] = "₊"
    subscriptDictionary["-"] = "₋"
    subscriptDictionary["a"] = "ₐ"
    subscriptDictionary["i"] = "ᵢ"
    subscriptDictionary["j"] = "ⱼ"
    subscriptDictionary["o"] = "ₒ"
    subscriptDictionary["u"] = "ᵤ"
    
    var returnString: String = ""
    for character in valueToMap {
        let replacementCharacter: Character
        if let subscriptCharacter = subscriptDictionary[character] {
            replacementCharacter = subscriptCharacter
        } else {
            replacementCharacter = character
        }
        returnString.append(replacementCharacter)
    }
    
    return returnString
}

