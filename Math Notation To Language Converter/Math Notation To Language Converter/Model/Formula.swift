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
    var tags : String
    var description : String
    var cat : Category
    var imgs : [String] = []

    init(cat : Category,symbol : Symbol,description : String, tag : String,img : String? = nil) {
        self.cat = cat
        self.symbols.append(symbol)
        self.description = description
        self.tags = tag
        if let picture = img {
            imgs.append(picture)
        }
    }
    
    func toString() -> String {
        return "symbols:\(allSymbols()) tags\(tags) description: \(description) imgs:\(imgs)"
    }
    
    func allSymbols() -> String {
        var str : String = " "
        for s in symbols {
            str += s.toString()
        }
        return str
    }
 
}
