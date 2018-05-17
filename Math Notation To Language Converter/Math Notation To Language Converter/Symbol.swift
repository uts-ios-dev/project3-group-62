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

    
    init(symbol : String, definations : Defination,img : String) {
        self.symbol = symbol
        self.definations.append(definations)
        self.imgs.append(img)
    }
    
    func toString() -> String {
        return "symbol: \(symbol) def:  imgs:\(imgs)"
    }
}
