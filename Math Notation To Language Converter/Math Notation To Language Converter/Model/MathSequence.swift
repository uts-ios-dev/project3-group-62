//
//  MathSequence.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation

enum MathSequenceType: String {
    case summation = "+"
    case product = "x"
}

class MathSequence {
  
    var sequenceVariable: String
    var startValue: String
    var endValue: String
    var sequence: String
    
    init(sequenceVariable: String, startValue: String, endValue: String, sequence: String) {
        self.sequenceVariable = sequenceVariable
        self.startValue = startValue
        self.endValue = endValue
        self.sequence = sequence
    }
    
    func updateFormula(sequenceType: MathSequenceType) -> String {
        let formula = "\(sequence)\(valueToSubscript(valueToMap: sequenceVariable))"
            + " = "
            + " (\(sequence))\(valueToSubscript(valueToMap: sequenceVariable))"
            + " + "
            + " (\(sequence))\(valueToSubscript(valueToMap: sequenceVariable))\(valueToSubscript(valueToMap: "+"))\(valueToSubscript(valueToMap: "1"))"
            + " \(sequenceType.rawValue) "
            + " (\(sequence))\(valueToSubscript(valueToMap: sequenceVariable))\(valueToSubscript(valueToMap: "+"))\(valueToSubscript(valueToMap: "2"))"
            + " \(sequenceType.rawValue) "
            + " (\(sequence))\(valueToSubscript(valueToMap: sequenceVariable))\(valueToSubscript(valueToMap: "+"))\(valueToSubscript(valueToMap: "3"))"
            + " \(sequenceType.rawValue) "
            + " ... "
            + " \(sequenceType.rawValue) "
            + " (\(sequence))\(valueToSubscript(valueToMap: sequenceVariable))\(valueToSubscript(valueToMap: "+"))\(valueToSubscript(valueToMap: endValue))"
        return formula
    }
    
}

    
