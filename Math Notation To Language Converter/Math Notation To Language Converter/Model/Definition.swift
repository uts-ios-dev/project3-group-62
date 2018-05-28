//
//  Defination.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Definition {
    var name : String
    var tag : String
    var meaning : String
    var description : String
    var url : String?
    
    init(name : String,tag : String, meaning : String, description : String, url : String? = nil) {
        self.name = name
        self.tag = tag
        self.meaning = meaning
        self.description = description
        self.url = url
    }
    
    public func toString() -> String {
        return "name :\(name) tag: \(tag) meaning: \(meaning) description: \(description) URL: \(url)"
    }
}
