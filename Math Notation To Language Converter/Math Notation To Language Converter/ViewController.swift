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
        //Test model data
//        let dictionary = Dictionary()
//        dictionary.testAddData()
//        dictionary.testRetrieveData()
        
        //DEV COMMENT   28/5/2018: Test Import of actual dictionary in CSV format
        //This is currently working and maintaining a properly delimited file format when re-writing.
        
        let dictionary = ReadCSV(filename: "Dictionary")
        dictionary.printData()
        if (dictionary.writeDataToFile(file: "transcribed")) {
            print("File Successfully Written")
        } else {
            print("File could not be written")
        }
        
        print("\n Total CSV Rows Imported: \n")
        print(dictionary.csvData.count)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

