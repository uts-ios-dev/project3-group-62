//
//  Symbol.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Modified by Peter Bower on 2018/5/30
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Symbol: NSObject, Comparable, SpecialMathObject, NSCoding {
    
    var symbol : String
    var imgs : [String] = []
    var name : String
    var tags : String
    var meaning : String
    var translation: String
    override var description : String { return self.toString() }
    var url : String?
    
    init(symbol : String, name : String,  meaning : String, translation: String, img : String? = nil, tags : String, url : String? = nil) {
        self.symbol = symbol
        self.name = name
        self.meaning = meaning
        self.translation = translation
        if let picture = img {
            imgs.append(picture)
        }
        self.tags = tags
        self.url = url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(symbol, forKey: "symbol")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(tags, forKey: "tags")
        aCoder.encode(meaning, forKey: "meaning")
        aCoder.encode(translation, forKey: "translation")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let symbol = aDecoder.decodeObject(forKey: "symbol") as! String
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let tags = aDecoder.decodeObject(forKey: "tags") as! String
        let meaning = aDecoder.decodeObject(forKey: "meaning") as! String
        let translation = aDecoder.decodeObject(forKey: "translation") as! String
        self.init(symbol: symbol, name: name, meaning: meaning, translation: translation, tags: tags)
    }
    
    static func < (lhs: Symbol, rhs: Symbol) -> Bool {      //implements comparable protocol for sorting by name asc
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Symbol, rhs: Symbol) -> Bool {
        return lhs.name == rhs.name
    }
    
    func toString() -> String {
        return "symbol: \(symbol) imgs:\(imgs) name :\(name) tags: \(tags) meaning: \(meaning) translation \(translation) URL: \(String(describing: url)) \n"
    }
}

