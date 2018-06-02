//
//  ProductVC.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

class ProductVC: UIViewController {
    
    var product: MathSequence
    
    required init?(coder aDecoder: NSCoder) {
        product = MathSequence(sequenceVariable: "i", startValue: "1", endValue: "100", sequence: "*2")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceVariableTf.text = product.sequenceVariable
        startValueTf.text = product.startValue
        endValueTf.text = product.endValue
        formulaTv.text = product.updateFormula(sequenceType: .product)
        sequenceTf.text = product.sequence
        updateDynamicFields()
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
            product.sequenceVariable = newText
        } else {
            product.sequenceVariable = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    @IBAction func startValueUpdated(_ sender: UITextField) {
        if let newText = startValueTf.text {
            product.startValue = newText
        } else {
            product.startValue = "i"
        }
        startValueDisplayTf.text = "\(sequenceVariableTf.text ?? "i")=\(startValueTf.text ?? "1")"
        updateDynamicFields()
    }
    
    
    @IBAction func endValueUpdated(_ sender: UITextField) {
        if let newText = endValueTf.text {
            product.endValue = newText
        } else {
            product.endValue = "100"
        }
        endValueDisplayTf.text = endValueTf.text
        updateDynamicFields()
    }
    
    @IBAction func sequenceUpdated(_ sender: UITextField) {
        if let newText = sequenceTf.text {
            product.sequence = newText
        } else {
            product.sequence = "a"
        }
        updateDynamicFields()
    }
    
    func updateDynamicFields() {
        formulaTv.text = product.updateFormula(sequenceType: .product)
        humanReadableTf.text = product.convertSequenceToEnglish(sequenceType: .product)
    }
    
    @IBOutlet weak var formulaTv: UITextView!
    
    @IBOutlet weak var startValueDisplayTf: UITextField!
    @IBOutlet weak var endValueDisplayTf: UITextField!
    
    @IBOutlet weak var humanReadableTf: UITextView!
    
}
