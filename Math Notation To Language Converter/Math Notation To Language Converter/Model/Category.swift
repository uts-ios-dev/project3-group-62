//
//  Category.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/17.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import Foundation

class Category {
    var name : String
    init(name : String) {
        self.name = name
    }
    public func toString()-> String{
        return "name: \(name)"
    }
}
