//
//  ProductVC.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 31/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

class ProductVC: UIViewController, MSVCProtocol {           //Adopts Math Sequence View (MSV) Protocol (see 'MathSequence' Folder)
    
    @IBOutlet weak var startValueDisplayTf: UITextField!     //View Outlets
    @IBOutlet weak var endValueDisplayTf: UITextField!
    @IBOutlet weak var formulaTv: UITextView!
    @IBOutlet weak var startValueTf: UITextField!
    @IBOutlet weak var sequenceVariableTf: UITextField!
    @IBOutlet weak var endValueTf: UITextField!
    @IBOutlet weak var sequenceTf: UITextField!
    @IBOutlet weak var humanReadableTf: UITextView!
    
    var sequenceView: MathSequenceView?                     //Variables (see 'MathSequence' Folder)
    var sequence: MathSequence
    var sequenceType: MathSequenceType = .product

    required init?(coder aDecoder: NSCoder) {               //Initialise with a default math sequence object
        sequence = MathSequence(sequenceVariable: "i", startValue: "1", endValue: "100", sequence: "*2")
        super.init(coder: aDecoder)
    }
    //Create sequenceView object that passes info to MathSequenceView, a type that handles changes for all math sequence view controllers
    override func viewDidLoad() {
        super.viewDidLoad()
        sequenceView = MathSequenceView(sequenceView: self)
        sequenceVariableTf.text = sequence.sequenceVariable
        startValueTf.text = sequence.startValue
        endValueTf.text = sequence.endValue
        formulaTv.text = sequence.updateFormula(sequenceType: sequenceType)
        sequenceTf.text = sequence.sequence
        sequenceView?.updateDynamicFields()
    }
    //Handle view updates by passing them back to the math sequence view object
    @IBAction func sequenceVariableUpdated(_ sender: UITextField) { sequenceView?.sequenceVariableUpdated(sender) }
    @IBAction func startValueUpdated(_ sender: UITextField) { sequenceView?.startValueUpdated(sender) }
    @IBAction func endValueUpdated(_ sender: UITextField) { sequenceView?.endValueUpdated(sender) }
    @IBAction func sequenceUpdated(_ sender: UITextField) { sequenceView?.sequenceUpdated(sender) }
    
}
