//
//  MathSequenceView.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 2/6/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

class MathSequenceView {
    
    var startValueDisplayTf:UITextField!
    var endValueDisplayTf:UITextField!
    var formulaTv:UITextView!
    var startValueTf:UITextField!
    var sequenceVariableTf:UITextField!
    var endValueTf:UITextField!
    var sequenceTf:UITextField!
    var humanReadableTf:UITextView!
    var sequence: MathSequence
    var sequenceType: MathSequenceType
    
    init(sequenceView: MSVCProtocol) {
        startValueDisplayTf = sequenceView.startValueDisplayTf
        endValueDisplayTf = sequenceView.endValueDisplayTf
        formulaTv = sequenceView.formulaTv
        startValueTf = sequenceView.startValueTf
        sequenceVariableTf = sequenceView.sequenceVariableTf
        endValueTf = sequenceView.endValueTf
        sequenceTf = sequenceView.sequenceTf
        humanReadableTf = sequenceView.humanReadableTf
        sequence = sequenceView.sequence
        sequenceType = sequenceView.sequenceType
    }
    
    func sequenceVariableUpdated(_ sender: UITextField) {
        if let newText = sequenceVariableTf.text {
            sequence.sequenceVariable = newText
        } else {
            sequence.sequenceVariable = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    func startValueUpdated(_ sender: UITextField) {
        if let newText = startValueTf.text {
            sequence.startValue = newText
        } else {
            sequence.startValue = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    func endValueUpdated(_ sender: UITextField) {
        if let newText = endValueTf.text {
            sequence.endValue = newText
        } else {
            sequence.endValue = "100"
        }
        endValueDisplayTf.text = endValueTf.text
        updateDynamicFields()
    }
    
    func sequenceUpdated(_ sender: UITextField) {
        if let newText = sequenceTf.text {
            sequence.sequence = newText
        } else {
            sequence.sequence = "a"
        }
        updateDynamicFields()
    }
    
    func updateDynamicFields() {
        formulaTv.text = sequence.updateFormula(sequenceType: sequenceType)
        humanReadableTf.text = sequence.convertSequenceToEnglish(sequenceType: sequenceType)
    }
}

