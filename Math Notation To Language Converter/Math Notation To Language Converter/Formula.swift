//
//  Formula.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Formula  {
    
    var symbols : [Symbol] = []
    var tags : [Tag] = []
    var description : String
    var imgs : [String] = []

    init(symbols : Symbol,tag : Tag, description : String, img : String) {
        self.symbols.append(symbols)
        self.tags.append(tag)
        self.description = description
        imgs.append(img)
        
    }
    
    func toString() -> String {
        return "symbols:\(allSymbols()) tags\(tags) description: \(description) imgs:\(imgs)"
    }
    
    func allSymbols() -> String {
        var str = ""
        for s in symbols {
            str += s.toString()
        }
        return str
    }
 
}
