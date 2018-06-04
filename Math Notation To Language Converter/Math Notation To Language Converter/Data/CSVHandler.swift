//
//  CSVHandler.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 28/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import Foundation

struct CSVHandler {
    
    let filename: String
    var csvData: [[String:String]] = []
    var columnNames: [String] = []
    
    init(filename: String) {                                                        //read file and convert it into tabular format
        self.filename = filename
    }
    
    mutating func loadData() {
        convertCSV(file: readDataFromFile(file: filename))
    }
    
    private func readDataFromFile(file:String)-> String!{
        guard let filepath = Bundle.main.path(forResource: file, ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents
        } catch {
            print ("File Read Error")
            return nil
        }
    }
    
    private mutating func convertCSV(file:String) {                                 //convert the CSV into tabular dictionary format
        let rows = fixCarriageReturns(file: file).components(separatedBy: "\n")
        if rows.count > 0 {
            csvData = []
            columnNames = rows.first!.components(separatedBy: ";")
            for row in rows {
                let fields = row.components(separatedBy: ";")
                if fields.count != columnNames.count {continue}
                var csvDataRow = [String:String]()
                for (index,field) in fields.enumerated(){
                    csvDataRow[columnNames[index]] = field
                }
                csvData += [csvDataRow]
            }
        } else {
            print("There was no CSV data found in \(filename)")
        }
    }
    
    private func fixCarriageReturns(file: String ) -> String {
        var fixedFile = file
        fixedFile = fixedFile.replacingOccurrences(of: "\r", with: "\n")
        fixedFile = fixedFile.replacingOccurrences(of: "\n\n", with: "\n")
        return fixedFile
    }
    
    func printData() {                                                              //prints the data in both model and row by row format for easy debugging
        var tableString = ""
        var rowString = ""
        print("\n\nPrinting CSV data in Tabular Dictionary Format: \n\n\(csvData)")
        for row in csvData {
            rowString = ""
            for fieldName in columnNames{
                guard let field = row[fieldName] else {
                    print("field not found: \(fieldName)")
                    continue
                }
                rowString += field + "\t"
            }
            tableString += rowString + "\n"
        }
        print("\n\nPrinting CSV data line by line: \n\n\(tableString)")
    }
    
    func writeDataToFile(file:String)-> Bool {                                     //writes data to a .txt file that can be imported into Apple Numbers to confirm row/column format is preserved
        guard let data = readDataFromFile(file: filename) else {return false}
        //print(data)
        var writeFileName = file + ".txt"
        if let filePath = Bundle.main.path(forResource: file, ofType: "txt"){
            writeFileName = filePath
            print("File written to: \(writeFileName)")
        } else {
            writeFileName = Bundle.main.bundlePath + writeFileName
            print("File written to: \(writeFileName)")
        }
        
        do{
            try data.write(toFile: writeFileName, atomically: true, encoding: String.Encoding.utf8 )
            return true
        } catch{
            return false
        }
    }
    
}
