//
//  Formula.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Modified by Peter Bower on 2018/05/30
//      Added:  Static/Dynamic type system , adjusted accessor methods
//      Comments:   Formulas are made up of one of 2 types:
//                  1. Sequences of symbols from the app
//                  2. Strings.
//                  Both otherwise share the same properties. Therefore the static / dynamic type system caters for each, and accessor methods are provided.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

enum FormulaType {
    case isStatic
    case isDynamic
}

class Formula: Comparable {
    
    var dynamicFormula : [Symbol] = []
    var staticFormula: String = ""
    var name: String
    var tags : String
    var description : String
    var cat : Category
    var imgs : [String] = []
    let formulaType: FormulaType
    
    //Static Formula Initialiser
    init(cat : Category, staticFormula: String, name: String, description : String, tag : String,img : String? = nil) {
        self.cat = cat
        self.staticFormula = staticFormula
        self.name = name
        self.description = description
        self.tags = tag
        if let picture = img {
            imgs.append(picture)
        }
        formulaType = .isStatic
    }
    
    //Dynamic Formula Initialiser
    init(cat : Category, symbol : Symbol, name: String, description : String, tag : String,img : String? = nil) {
        var dynamicFormula : [Symbol] = []
        self.cat = cat
        dynamicFormula.append(symbol)
        self.name = name
        self.description = description
        self.tags = tag
        if let picture = img {
            imgs.append(picture)
        }
        formulaType = .isDynamic
    }
    
    func toString() -> String {
        return "formula: \(getFormula()) type: tags\(tags) description: \(description) imgs:\(imgs)"
    }
    
    
    func getFormula() -> String {
        switch formulaType {
        case .isDynamic:
            var str : String = " "
            for s in dynamicFormula {
                str += s.toString()
            }
            return str
        case .isStatic:
            return staticFormula
        }
    }
    
    func getFormulaTypeName() -> String {
        switch formulaType {
        case .isStatic:  return "Static"
        case .isDynamic: return "Dynamic"
        }
    }
    
    static func < (lhs: Formula, rhs: Formula) -> Bool {      //implements comparable protocol for sorting by name asc
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Formula, rhs: Formula) -> Bool {
        return lhs.name == rhs.name
    }
    
}


<<<<<<< HEAD
=======

>>>>>>> master
