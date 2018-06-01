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
        var startValueInt: Int = 0
        var endValueInt: Int = 0
        
        if let int = Int(startValue) { startValueInt = int }
        if let int = Int(endValue) { endValueInt = int }
        
        let totalIterations = endValueInt - startValueInt + 1
        
        var formula = "\(sequenceVariable)\(sequence) =  (\(startValue)\(sequence))"
        if totalIterations >= 2 {
            formula += " \(sequenceType.rawValue) (\(String(startValueInt+1))\(sequence))"
        }
        if totalIterations >= 3 {
            formula += " \(sequenceType.rawValue) (\(String(startValueInt+2))\(sequence))"
        }
        if totalIterations >= 4 {
            formula += " \(sequenceType.rawValue)  ...  \(sequenceType.rawValue)  (\(String(endValueInt))\(sequence))"
        }
        formula += "\n\nResult:\n\n\(calculateMathSequence(startValue: startValueInt, endValue: endValueInt, sequenceType: sequenceType, sequence: sequence) ?? 0)"
        return formula
    }
    
    func calculateMathSequence(startValue: Int, endValue: Int, sequenceType: MathSequenceType, sequence: String) -> Int? {
        var result: Int = 0
        let start: Int
        let end: Int
        if endValue > startValue {
            start = startValue
            end = endValue
        } else if endValue < startValue {
            start = endValue
            end = startValue
        } else {
            return nil
        }
        
        for index in start...end {
            switch sequenceType {
            case .summation: result += evaluateExpression(expression: String(index)+sequence)
            case .product: result *= evaluateExpression(expression: String(index)+sequence)
            }
        }
        return result
    }
    
    func evaluateExpression(expression: String) -> Int {
        //Convert String expression to an actual expression to be evaluated
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return 0
        }
    }
    //startValue: Int, endValue: Int, sequenceVariable: String, sequenceType: MathSequenceType, expression: String
    func convertSequenceToEnglish(sequenceType: MathSequenceType) -> String {
        let expression = sequenceVariable+sequence
        let operationText: String
        switch sequenceType {
        case .summation:    operationText = "summing"
        case .product:  operationText = "multiplying"
        }
        
        return "Evaluate the expression \(expression) \(getNumberOfTimes()) times by starting at \(sequenceVariable)  = \(startValue), up until \(sequenceVariable) = \(endValue) , and \(operationText) the accumulated result each time."
    }
    
    func getNumberOfTimes() -> String {
        if let endNum = Int(endValue), let startNum = Int(startValue) {
            let numberOfTimes = endNum - startNum + 1
            return String(numberOfTimes)
        } else {
            return "\(endValue) - \(startValue) + 1"
        }
    }
}

    
