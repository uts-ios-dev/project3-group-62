//
//  Symbol.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Symbol  {
    var symbol : String
    var definition : [Definition] = []
    var imgs : [String] = []
    var cat : Category
    
    init(cat : Category,symbol : String, definition : Definition,img : String? = nil) {
        self.cat = cat
        self.symbol = symbol
        self.definition.append(definition)
        if let picture = img {
            imgs.append(picture)
        }
    }
    
    func printAllDefs() ->String{
        var output = ""
        for def in definition {
            output += def.toString()
        }
        return output
    }
    
    func toString() -> String {
        return "symbol: \(symbol) def:\(printAllDefs())  imgs:\(imgs) cat: \(cat.toString())"
    }
}
