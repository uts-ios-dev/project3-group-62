//
//  SourceData.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 30/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

class SourceData {
    
    var symbolArray: [Symbol] = []                          //raw array of symbols & formulas
    var formulaArray: [Formula] = []
    var dataImport: CSVHandler
    
    init() {
        //Read CSV File
        dataImport = CSVHandler(filename: "Symbols")
        dataImport.loadData()
        printNumberOfSymbolsImported()
        populateModelObjects()
    }
    
    func populateModelObjects() {
        //Populate Data Model dictionary data structure
        for i in 1..<dataImport.csvData.count {
            let newSymbol = Symbol(
                symbol : dataImport.csvData[i]["Symbol"]!,
                name : dataImport.csvData[i]["Name"]!,
                meaning : dataImport.csvData[i]["Meaning"]!,
                translation: dataImport.csvData[i]["Translation"]!,
                img : nil,
                tags : dataImport.csvData[i]["Tags"]!,
                url : nil)
            symbolArray.append(newSymbol)
        }
    }
    
    func printNumberOfSymbolsImported() {
        print("\n Total Symbols Imported: \n \(dataImport.csvData.count) \n")
    }
    
    func printImportedData() {
        //Read in from CSV dictionary import structure (use to debug load)
        for columnNo in 1..<dataImport.columnNames.count {
            let columnName = dataImport.columnNames[columnNo]
            for i in 1..<dataImport.csvData.count {
                print("\(dataImport.csvData[i][columnName]!)")
            }
        }
    }
    
    func getAllSymbolsList() -> [String] {
        var output : [String] = []
        for symbol in symbolArray {
            output.append(symbol.symbol)
        }
        return output
    }
    
    func getAllFormulasList() -> [String] {
        var output : [String] = []
        for formula in formulaArray {
            output.append(formula.getFormula())
        }
        return output
    }
    
    func printAllSymbols() {
        print("All Symbols:")
        for symbol in symbolArray {
            print(symbol.toString())
        }
    }
    
    func printAllFormulas() {
        print("All formulas:")
        for formula in formulaArray {
            print(formula.toString())
        }
    }
}
