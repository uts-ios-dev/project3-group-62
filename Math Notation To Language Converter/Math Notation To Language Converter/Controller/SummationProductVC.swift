//
//  SummationProductVC.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

class SummationProductVC: UIViewController {
    
    var summation: MathSequence
    
    required init?(coder aDecoder: NSCoder) {
        summation = MathSequence(sequenceVariable: "i", startValue: "1", endValue: "100", sequence: "")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceVariableTf.text = summation.sequenceVariable
        startValueTf.text = summation.startValue
        endValueTf.text = summation.endValue
        formulaTv.text = summation.updateFormula(sequenceType: .summation)
        sequenceTf.text = summation.sequence
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sequenceVariableTf: UITextField!
    
    @IBOutlet weak var startValueTf: UITextField!
    
    @IBOutlet weak var endValueTf: UITextField!
    
    @IBOutlet weak var sequenceTf: UITextField!
    
    @IBAction func sequenceVariableUpdated(_ sender: UITextField) {
        if let newText = sequenceVariableTf.text {
            summation.sequenceVariable = newText
        } else {
            summation.sequenceVariable = "i"
        }
        startValueSummation.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        formulaTv.text = summation.updateFormula(sequenceType: .summation)
    }
    
    @IBAction func startValueUpdated(_ sender: UITextField) {
        if let newText = startValueTf.text {
            summation.startValue = newText
        } else {
            summation.startValue = "i"
        }
        startValueSummation.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        formulaTv.text = summation.updateFormula(sequenceType: .summation)
    }
    
    
    @IBAction func endValueUpdated(_ sender: UITextField) {
        if let newText = endValueTf.text {
            summation.endValue = newText
        } else {
            summation.endValue = "100"
        }
        endValueSummation.text = endValueTf.text
        formulaTv.text = summation.updateFormula(sequenceType: .summation)
    }
    
    @IBAction func sequenceUpdated(_ sender: UITextField) {
        if let newText = sequenceTf.text {
            summation.sequence = newText
        } else {
            summation.sequence = "a"
        }
        formulaTv.text = summation.updateFormula(sequenceType: .summation)
    }
    
    @IBOutlet weak var formulaTv: UITextView!
    
    @IBOutlet weak var startValueSummation: UITextField!
    @IBOutlet weak var endValueSummation: UITextField!

    
}
