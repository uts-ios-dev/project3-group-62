//
//  Dictionary.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/24.
//  Modified by Peter Bower on 2018/05/30
//      Comments:
//          Added Dictionary properties
//          Added Dictionaries to access data by key / value pairs.
//          Added accessor methods
//      DEV COMMENTS:
//          If we choose to add custom definitions or model persistence, we will need to add updater functions that keep the source Symbol/Formula Arrays and Dictionary objects in sync
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Dictionary: SourceData {
    
    var symbolDictionary: [String:Symbol] = [:]             //dictionaries to access symbol/formula properties by symbol/formula
    var formulaDictionary: [String:Formula] = [:]
    var symbolNameDictionary: [String:Symbol] = [:]         //dictionaries to access symbol/formula properties by symbol/formula name
    var formulaNameDictionary: [String:Formula] = [:]
    var categorySetDictionary: [String:[Symbol]] = [:]      //category set to store unique categories and their associated symbols
    //DEV Note: categorySetDictionary will be extended to include formulas
    
    override init() {
        super.init()
        //Create Symbol Dictionaries
        for symbol in symbolArray {
            symbolDictionary[symbol.symbol] = symbol
            symbolNameDictionary[symbol.name] = symbol
        }
        
        //Create Formula Dictionaries
        for formula in formulaArray {
            formulaDictionary[formula.getFormula()] = formula
            formulaNameDictionary[formula.name] = formula
        }
        
        //Create temporary category set used to create the category set dictionary)
        var categorySet = Set<String>()
        for symbol in symbolArray {
            let separatedTags = separateTags(tagField: symbol.tags)
            for tag in separatedTags {
                categorySet.insert(tag)
            }
        }
        
        //Create category set dictionary
        for category in categorySet {
            var categorySymbols: [Symbol] = []
            for symbol in symbolArray {
                var counter = 0
                let separatedTags = separateTags(tagField: symbol.tags)
                for tag in separatedTags {
                    if(tag == category) {
                        categorySymbols.insert(symbol, at: counter)
                        counter += counter
                    }
                }
            }
            categorySetDictionary[category] = categorySymbols
        }
    }
    
    func separateTags(tagField: String) -> [String] {
        let separatedTags = tagField.components(separatedBy: ",")
        return separatedTags
    }
    
    func getSymbolDataBySymbol(symbolCharacter: String) -> Symbol? {
        return symbolDictionary[symbolCharacter]
    }
    
    func getSymbolDataByName(symbolName: String) -> Symbol? {
        return symbolNameDictionary[symbolName]
    }
    
    func getFormulaDataByFormula(formulaString: String) -> Formula? {
        return formulaDictionary[formulaString]
    }
    
    func getFormulaDataByName(formulaName: String) -> Formula? {
        return formulaNameDictionary[formulaName]
    }
    
    func getCategories() -> [String] {
        var categories: [String] = []
        for category in categorySetDictionary {
            categories.append(category.key)
        }
        categories.sort()
        return categories
    }
    
    //    func getSymbolsInCategory(category: String) -> [String] {
    //        if let symbols = categorySetDictionary[category] {
    //            var symbolCharacters: [String] = []
    //            for symbol in symbols {
    //                symbolCharacters.append(symbol.symbol)
    //            }
    //            return symbolCharacters.sorted()
    //        } else {
    //            return []
    //        }
    //    }
    
    //    func testAddData() {
    //Add new data sample
    
    //        //Symbol
    //        let def = Definition(name: "plus", tag: "Basic", meaning: "add", translation: "", description: "1 + 1 = 2",url:"blog.sparrow.moe")
    //        //Create and assign category & definition
    //        let symbolCat = Category(name: "Basic Symbol")
    //        let symbol = Symbol(cat: symbolCat, symbol: "+", definition: def)
    //        //Finally add this symbol to dictioray array
    //        symbols.append(symbol)
    //        //Symbol 2
    //        //Symbol
    //        let defTwo = Definition(name: "minus", tag: "Basic", meaning: "minus", translation: "", description: "1 - 1 = 0",url:"blog.sparrow.moe")
    //        //Create and assign category & definition
    //        let symbolCatTwo = Category(name: "Basic Symbol")
    //        let symbolTwo = Symbol(cat: symbolCatTwo, symbol: "-", definition: defTwo)
    //        //Finally add this symbol to dictioray array
    //        symbols.append(symbolTwo)
    //
    //        //Formula
    //        let formulaCat = Category(name: "Basic Math")
    //        let formula = Formula(cat: formulaCat, symbol: symbol, description: "Addition", tag: "Basic")
    //        formulas.append(formula)
    //    }
}





