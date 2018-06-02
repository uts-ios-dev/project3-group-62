//
//  MSVCProtocol.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 2/6/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

protocol MSVCProtocol {     //Math Sequence View Controller (MSVC) Protocol
    
    var startValueDisplayTf:UITextField! { get set }
    var endValueDisplayTf:UITextField! { get set }
    var formulaTv:UITextView! { get set }
    var startValueTf:UITextField! { get set }
    var sequenceVariableTf:UITextField! { get set }
    var endValueTf:UITextField! { get set }
    var sequenceTf:UITextField! { get set }
    var humanReadableTf:UITextView! { get set }
    var sequence: MathSequence { get set }
    var sequenceType: MathSequenceType { get set }
    
}

