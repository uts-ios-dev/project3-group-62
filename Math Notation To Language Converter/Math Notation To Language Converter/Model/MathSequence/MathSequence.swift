//
//  MathSequence.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation

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
        formula += "\n\nResult:\n\n\(calculateMathSequence(startValue: startValueInt, endValue: endValueInt, sequenceType: sequenceType, sequence: sequence))"
        return formula
    }
    
    func calculateMathSequence(startValue: Int, endValue: Int, sequenceType: MathSequenceType, sequence: String) -> Int {
        var accumResult: Int
        let start: Int
        let end: Int
        
        switch sequenceType {
        case .summation: accumResult = 0
        case .product: accumResult = 1
        }
        
        if endValue > startValue || endValue == startValue{
            start = startValue
            end = endValue
        } else if endValue < startValue {
            start = endValue
            end = startValue
        } else {
            return 0
        }
        
        for index in start...end {
            do {
                switch sequenceType {
                case .summation: try accumResult += evaluateExpression(expression: String(index)+sequence)
                case .product: try accumResult *= evaluateExpression(expression: String(index)+sequence)
                }
            } catch {
                    print("Out of range.")
            }
        }
        return accumResult
    }
    
    func evaluateExpression(expression: String) throws -> Int {
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

    
