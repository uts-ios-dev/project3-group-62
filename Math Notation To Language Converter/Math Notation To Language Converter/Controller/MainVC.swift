//
//  ViewController.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 10/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Test model data
//        let dictionary = Dictionary()
//        dictionary.testAddData()
//        dictionary.testRetrieveData()
    
          PopulateObjectsFromCSVSource()    //populate model objects
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

