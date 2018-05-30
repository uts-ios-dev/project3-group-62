//
//  Symbol.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Modified by Peter Bower on 2018/5/30
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Symbol: CustomStringConvertible {
    var symbol : String
    var imgs : [String] = []
    var cat : Category
    var name : String
    var tag : String
    var meaning : String
    var translation: String
    var description : String { return self.toString()}
    var url : String?
    
    init(symbol : String, name : String,  meaning : String, translation: String, cat : Category, img : String? = nil, tag : String, url : String? = nil) {
        self.symbol = symbol
        self.name = name
        self.meaning = meaning
        self.translation = translation
        self.cat = cat
        if let picture = img {
            imgs.append(picture)
        }
        self.tag = tag
        self.url = url
    }
    
//    func printAllDefs() ->String{
//        var output = ""
//        for def in definition {
//            output += def.toString()
//        }
//        return output
//    }
    
    func toString() -> String {
        return "symbol: \(symbol) imgs:\(imgs) cat: \(cat.toString()) name :\(name) tag: \(tag) meaning: \(meaning) translation \(translation) URL: \(String(describing: url)) \n"
    }
}
