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
        
        print("\n Total CSV Rows Imported: \n \(dictionary.csvData.count) \n")

        //Test Read in from the dictionary data structure
        for columnNo in 1..<dictionary.columnNames.count {
            let columnName = dictionary.columnNames[columnNo]
            for i in 1..<dictionary.csvData.count {
                print("\(dictionary.csvData[i][columnName]!)")
            }
        }
        
        var dataModel: [Symbol] = []
        //Populate Data Model dictionary data structure
        for i in 1..<dictionary.csvData.count {
           
            let newSymbol = Symbol(
                cat: Category(name: "NULL"),
                symbol : dictionary.csvData[i]["Symbol"]!,
                definition : Definition(
                    name : "Not Yet Implemented",                                    //DEV COMMENT Peter: Will add names to the CSV file
                    tag : dictionary.csvData[i]["Tags"]!,
                    meaning : dictionary.csvData[i]["Meaning"]!,
                    translation: dictionary.csvData[i]["Translation"]!,
                    description : "NULL",                                           //Suggest we import the description from 3rd party website e.g. Simple Wikipedia
                    url : nil),
                img : nil)
            dataModel.append(newSymbol)
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

