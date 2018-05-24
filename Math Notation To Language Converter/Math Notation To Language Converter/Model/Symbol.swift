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
    var definations : [Defination] = []
    var imgs : [String] = []
    var cat : Category
    
    init(cat : Category,symbol : String, defination : Defination,img : String? = nil) {
        self.cat = cat
        self.symbol = symbol
        self.definations.append(defination)
        if let picture = img {
            imgs.append(picture)
        }
    }
    
    func printAllDefs() ->String{
        var output = ""
        for def in definations {
            output += def.toString()
        }
        return output
    }
    
    func toString() -> String {
        return "symbol: \(symbol) def:\(printAllDefs())  imgs:\(imgs) cat: \(cat.toString())"
    }
}
