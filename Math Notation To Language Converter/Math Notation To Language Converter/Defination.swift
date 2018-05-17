//
//  Defination.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Defination{
    var name : String
    var tags : [Tag] = []
    var meaning : String
    var description : String
    var URL : String
    
    init(name : String,tag : Tag, meaning : String, description : String, URL : String) {
        self.name = name
        self.tags.append(tag)
        self.meaning = meaning
        self.description = description
        self.URL = URL
    }
}
