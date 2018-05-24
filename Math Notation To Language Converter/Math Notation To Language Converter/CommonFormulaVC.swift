//
//  CommonFormulaVC.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 24/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

// Show a list of formula belonging to the category user selected with short description
// User change text in search bar, the result would be different and match the keywords
// User click one of the result, promote to FormulaDetail View
class CommonFormulaVC: UIViewController {
    @IBOutlet weak var keywordSearchBar: UISearchBar!
    @IBOutlet weak var cFormulaItem: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var keywords = keywordSearchBar.text {
            didSet {
                searchTextChanged()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function for text in search bar changed
    func searchTextChanged() {
        
    }
    
    // Function for user click one of the common formula?
}
