//
//  Dictionary.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/24.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Dictionary {
    var formulaCategories : [Category] = []
    var symbolCategories : [Category] = []
    
    var symbols : [Symbol] = []
    var formulas : [Formula] = []
    
    func testAddData() {
        //Add new data sample
        
        //Symbol
        let def = Definition(name: "plus", tag: "Basic", meaning: "add", translation: "", description: "1 + 1 = 2",url:"blog.sparrow.moe")
        //Create and assign category & definition
        let symbolCat = Category(name: "Basic Symbol")
        let symbol = Symbol(cat: symbolCat, symbol: "+", definition: def)
        //Finally add this symbol to dictioray array
        symbols.append(symbol)
        
        //Formula
        let formulaCat = Category(name: "Basic Math")
        let formula = Formula(cat: formulaCat, symbol: symbol, description: "Addition", tag: "Basic")
        formulas.append(formula)
    }
    
    func testRetrieveData(){
        //All Symbols
        print("All Symbols:")
        for symbol in symbols {
            print(symbol.toString())
        }
        //All formulas
        print("All formulas:")
        for formula in formulas {
            print(formula.toString())
        }
    }
}

