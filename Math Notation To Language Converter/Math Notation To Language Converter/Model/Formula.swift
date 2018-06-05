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

class Formula: NSObject, Comparable, SpecialMathObject, NSCoding {

    var dynamicFormula : [Symbol] = []
    var staticFormula: String = ""
    var name: String
    var tags : String
    var info : String
    var imgs : [String] = []
    let formulaType: FormulaType
    override var description: String { return self.toString() }
    
    //Static Formula Initialiser
    init(staticFormula: String, name: String, info : String, tags : String, img : String? = nil) {
        self.staticFormula = staticFormula
        self.name = name
        self.info = info
        self.tags = tags
        if let picture = img {
            imgs.append(picture)
        }
        formulaType = .isStatic
    }
    
    //Dynamic Formula Initialiser
    init(symbol : Symbol, name: String, info : String, tag : String,img : String? = nil) {
        var dynamicFormula : [Symbol] = []
        dynamicFormula.append(symbol)
        self.name = name
        self.info = info
        self.tags = tag
        if let picture = img {
            imgs.append(picture)
        }
        formulaType = .isDynamic
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(staticFormula, forKey: "staticFormula")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(info, forKey: "info")
        aCoder.encode(tags, forKey: "tags")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let staticFormula = aDecoder.decodeObject(forKey: "staticFormula") as! String
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let info = aDecoder.decodeObject(forKey: "info") as! String
        let tags = aDecoder.decodeObject(forKey: "tags") as! String
        self.init(staticFormula: staticFormula, name: name, info: info, tags: tags)
    }
    
    func toString() -> String {
        return "formula: \(getFormula()) type: \(tags) info: \(info) imgs:\(imgs)"
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



