//
//  FavoriteViewController.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 17/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

/**
 * In this view a list of favorite symbols and formulas will be shown
 */
class FavoritesVC: UIViewController {
    @IBOutlet weak var keywordsSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var keywords = keywordsSearchBar.text {
            didSet {
                searchTextChanged()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func itemClicked(_ sender: Any) {
        // Promote to SymbolDetail View or FormulaDetail View
    }
    
    func searchTextChanged() {
        
    }

}
