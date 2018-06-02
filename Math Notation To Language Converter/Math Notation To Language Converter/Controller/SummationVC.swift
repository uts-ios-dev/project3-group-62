//
//  SummationProductVC.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

class SummationVC: UIViewController {
    
    @IBOutlet weak var startValueDisplayTf: UITextField!
    @IBOutlet weak var endValueDisplayTf: UITextField!
    @IBOutlet weak var formulaTv: UITextView!
    @IBOutlet weak var startValueTf: UITextField!
    @IBOutlet weak var sequenceVariableTf: UITextField!
    @IBOutlet weak var endValueTf: UITextField!
    @IBOutlet weak var sequenceTf: UITextField!
    @IBOutlet weak var humanReadableTf: UITextView!
    
    var sequenceType: MathSequence
    
    required init?(coder aDecoder: NSCoder) {
        sequenceType = MathSequence(sequenceVariable: "i", startValue: "1", endValue: "100", sequence: "*2")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceVariableTf.text = sequenceType.sequenceVariable
        startValueTf.text = sequenceType.startValue
        endValueTf.text = sequenceType.endValue
        formulaTv.text = sequenceType.updateFormula(sequenceType: .summation)
        sequenceTf.text = sequenceType.sequence
        updateDynamicFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sequenceVariableUpdated(_ sender: UITextField) {
        if let newText = sequenceVariableTf.text {
            sequenceType.sequenceVariable = newText
        } else {
            sequenceType.sequenceVariable = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    @IBAction func startValueUpdated(_ sender: UITextField) {
        if let newText = startValueTf.text {
            sequenceType.startValue = newText
        } else {
            sequenceType.startValue = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    @IBAction func endValueUpdated(_ sender: UITextField) {
        if let newText = endValueTf.text {
            sequenceType.endValue = newText
        } else {
            sequenceType.endValue = "100"
        }
        endValueDisplayTf.text = endValueTf.text
        updateDynamicFields()
    }
    
    @IBAction func sequenceUpdated(_ sender: UITextField) {
        if let newText = sequenceTf.text {
            sequenceType.sequence = newText
        } else {
            sequenceType.sequence = "a"
        }
        updateDynamicFields()
    }
    
    func updateDynamicFields() {
        formulaTv.text = sequenceType.updateFormula(sequenceType: .summation)
        humanReadableTf.text = sequenceType.convertSequenceToEnglish(sequenceType: .summation)
    }
}
