//
//  Data.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

/*
    This is test sample data
 */



var categories : [Category] = []
var formulas : [Formula] = []


func testData() {
    
    let tag = Tag(name: "Basic")
    let cat = Category(tag: tag, name: "Basic Operation")
    categories.append(cat)
    
    let def = Defination(name: "+", tag: tag, meaning: "plus", description: "plus two number", URL: "http://blog.sparrow.moe")
    let symbol = Symbol(symbol: "+", definations: def, img: "")
    let formula = Formula(symbols: symbol, tag: tag, description: "1 + 1 = 11", img: "")
    formulas.append(formula)
}

func displayData(){
    for f in formulas {
        print("data:\(f.toString())")
    }
}



