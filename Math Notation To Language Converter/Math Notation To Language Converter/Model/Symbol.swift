//
//  Symbol.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Modified by Peter Bower on 2018/5/30
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Symbol: CustomStringConvertible, Comparable, SpecialMathObject {
    
    var symbol : String
    var imgs : [String] = []
    var name : String
    var tags : String
    var meaning : String
    var translation: String
    var description : String { return self.toString() }
    var url : String?
    
    init(symbol : String, name : String,  meaning : String, translation: String, img : String? = nil, tags : String, url : String? = nil) {
        self.symbol = symbol
        self.name = name
        self.meaning = meaning
        self.translation = translation
        if let picture = img {
            imgs.append(picture)
        }
        self.tags = tags
        self.url = url
    }
    
    static func < (lhs: Symbol, rhs: Symbol) -> Bool {      //implements comparable protocol for sorting by name asc
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.name == rhs.name
    }
    
    func toString() -> String {
        return "symbol: \(symbol) imgs:\(imgs) name :\(name) tags: \(tags) meaning: \(meaning) translation \(translation) URL: \(String(describing: url)) \n"
    }
}

