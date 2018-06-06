//
//  UIViewControllerDismissKb.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 6/6/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //Stops the keyboard from getting stuck
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
