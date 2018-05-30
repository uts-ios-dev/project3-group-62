//
//  PopulateModel.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 30/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

func PopulateObjectsFromCSVSource() {
    
    //Read CSV File
    let dictionary = ReadCSV(filename: "Dictionary")
    
    print("\n Total CSV Rows Imported: \n \(dictionary.csvData.count) \n")  //confirm #rows imported
    
//    //Read in from dictionary data structure (uncomment to debug load)
//    for columnNo in 1..<dictionary.columnNames.count {
//        let columnName = dictionary.columnNames[columnNo]
//        for i in 1..<dictionary.csvData.count {
//            print("\(dictionary.csvData[i][columnName]!)")
//        }
//    }
    
    //Populate Data Model dictionary data structure
    var dataModel: [Symbol] = []
    for i in 1..<dictionary.csvData.count {
        let newSymbol = Symbol(
            cat: Category(name: "NULL"),
            symbol : dictionary.csvData[i]["Symbol"]!,
            definition : Definition(
                name : dictionary.csvData[i]["Name"]!,
                tag : dictionary.csvData[i]["Tags"]!,
                meaning : dictionary.csvData[i]["Meaning"]!,
                translation: dictionary.csvData[i]["Translation"]!,
                description : "NULL",
                url : nil),
            img : nil)
        dataModel.append(newSymbol)
    }
    
}
