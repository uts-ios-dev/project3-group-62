//
//  ViewController.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 10/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Test data
        let dictionary = Dictionary()
        dictionary.testAddData()
        dictionary.testRetrieveData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

