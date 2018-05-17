//
//  Category.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Category {
    var tags : [Tag] = []
    var name : String
    init(tag : Tag,name : String) {
        self.tags.append(tag)
        self.name = name
    }
}
