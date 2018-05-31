//
//  ResultViewController.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 17/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

/**
 * In result view, the app will show the result list of symbol that belonging to
 * the category user selected, or match user's input.
 * In this view, for each symbol, only a short description will be shown.
 * User could click anyone of them to show the detail.
 */
class ResultVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // The list of result will be set (maybe a list of button?)
        // And also set the onclick method
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // This function will be called when user click anyone of the result
    func showDetail(button: UIButton) {
        // Maybe get the symbol name and set it to user default
        // and then go to result view?
    }

}
