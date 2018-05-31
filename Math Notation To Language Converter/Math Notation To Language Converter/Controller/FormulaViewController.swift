//
//  FormulaViewController.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 24/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

// User click a category and promot to CommmonFormula View
// User input a Formula, click search button, promote to FormulaDetail View
class FormulaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Function for textfield changed
    @IBAction func formulaChanged(_ sender: UITextField) {
        // Save the text
    }
    
    // Function for return button on keyboard clicked
    func returnButtonClicked() {
        // Promote to FormulaDetailView
        // Pass the formula text to FormulaDetail View
    }
    
    // Function for clicked category button
    @IBAction func categoryClicked(_ sender: Any) {
        // Save that category and promote to CommonFormula View
    }
}
