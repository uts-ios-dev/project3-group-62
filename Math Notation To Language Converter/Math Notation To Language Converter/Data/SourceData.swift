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
    var symbolImport: CSVHandler
    var formulaImport: CSVHandler
    
    init() {
        
        //Create CSV File References
        symbolImport = CSVHandler(filename: "Symbols")
        formulaImport = CSVHandler(filename: "StaticFormulas")
        
        //Populate Symbol Array from CSV File
        symbolImport.loadData()
        printNumberOfSymbolsImported()
        populateSymbolModelObjects()
        
        //Populate Formula Array from CSV File
        formulaImport.loadData()
        printNumberOfFormulasImported()
        populateFormulaModelObjects()
        
    }
    
    func populateSymbolModelObjects() {
        //Populate Data Model dictionary data structure
        for i in 1..<symbolImport.csvData.count {
            let newSymbol = Symbol(
                symbol : symbolImport.csvData[i]["Symbol"]!,
                name : symbolImport.csvData[i]["Name"]!,
                meaning : symbolImport.csvData[i]["Meaning"]!,
                translation: symbolImport.csvData[i]["Translation"]!,
                img : nil,
                tags : symbolImport.csvData[i]["Tags"]!,
                url : nil)
            symbolArray.append(newSymbol)
        }
    }
    
    func populateFormulaModelObjects() {
        //Populate Data Model dictionary data structure
        for i in 1..<formulaImport.csvData.count {
            let newFormula = Formula(
                staticFormula: formulaImport.csvData[i]["Formula"]!,
                name: formulaImport.csvData[i]["Name"]!,
                info: formulaImport.csvData[i]["Info"]!,
                tags: formulaImport.csvData[i]["Tags"]!)
            formulaArray.append(newFormula)
        }
    }
    
    func printNumberOfSymbolsImported() {
        print("\n Total Symbols Imported: \n \(symbolImport.csvData.count) \n")
    }
    
    func printNumberOfFormulasImported() {
        print("\n Total Formulas Imported: \n \(formulaImport.csvData.count) \n")
    }
    
    func printImportedSymbolData() {
        //Read in from CSV dictionary import structure (use to debug load)
        for columnNo in 1..<symbolImport.columnNames.count {
            let columnName = symbolImport.columnNames[columnNo]
            for i in 1..<symbolImport.csvData.count {
                print("\(symbolImport.csvData[i][columnName]!)")
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
