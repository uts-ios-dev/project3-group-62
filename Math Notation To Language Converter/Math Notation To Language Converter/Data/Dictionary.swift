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
    var symbolCategorySetDictionary: [String:[Symbol]] = [:]      //category set to store unique symbol categories and their associated symbols
    var formulaCategorySetDictionary: [String:[Formula]] = [:]      //category set to store unique formula categories

    
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
        
        //Create temporary symbol category set used to create the category set dictionary)
        let tempSymbolSet = makeCategorySet(array: symbolArray)
        let tempFormulaSet = makeCategorySet(array: formulaArray)
        
        //Create symbol category set dictionary
        symbolCategorySetDictionary = makeCategorySetDictionary(categorySet: tempSymbolSet, array: symbolArray) as! [String : [Symbol]]
        formulaCategorySetDictionary = makeCategorySetDictionary(categorySet: tempFormulaSet, array: formulaArray) as! [String : [Formula]]

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
    
    func getSymbolCategories() -> [String] {
        var symbolCategories: [String] = []
        for symbolCategory in symbolCategorySetDictionary {
            symbolCategories.append(symbolCategory.key)
        }
        symbolCategories.sort()
        return symbolCategories
    }
    
    func getFormulaCategories() -> [String] {
        var formulaCategories: [String] = []
        for formulaCategory in formulaCategorySetDictionary {
            formulaCategories.append(formulaCategory.key)
        }
        formulaCategories.sort()
        return formulaCategories
    }
    
    //The below generic function is used to make category sets for different math class types (e.g. Formula, Symbol)
    private func makeCategorySet<T: SpecialMathObject>(array: [T]) -> Set<String> {
        var categorySet = Set<String>()
        for item in array {
            let separatedTags = separateTags(tagField: item.tags)
            for tag in separatedTags {
                categorySet.insert(tag)
            }
        }
        return categorySet
    }
    
    private func makeCategorySetDictionary<T: SpecialMathObject>(categorySet: Set<String>, array: [T]) -> [String:[SpecialMathObject]] {
        var categorySetDictionary: [String:[SpecialMathObject]] = [:]
        for category in categorySet {
            var categoryItems: [SpecialMathObject] = []
            for item in array {
                var counter = 0
                let separatedTags = separateTags(tagField: item.tags)
                for tag in separatedTags {
                    if(tag == category) {
                        categoryItems.insert(item, at: counter)
                        counter += counter
                    }
                }
            }
        categorySetDictionary[category] = categoryItems
        }
        return categorySetDictionary
    }
    
    
}





