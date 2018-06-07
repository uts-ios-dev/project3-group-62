//
//  SourceData.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 30/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//
//  Firebase integration Added by サイラク on 2018/5/24.
//
//  This file populates the app model objects with data loaded via the CSV Handler, and from the live firebase app.
//  CSV is for the initial source content that we built in StaticFormulas.csv and Symbols.csv
//  Firebase is a live system that instantly updates for users, however requires them to have a live internet connection.


import Firebase
import FirebaseDatabase

class SourceData {
    
    var symbolArray: [Symbol] = []                          //raw array of symbols & formulas
    var formulaArray: [Formula] = []
    var symbolImport: CSVHandler
    var formulaImport: CSVHandler
    
    //Firebase
    var ref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    
   
    init() {
    
        print("SourceData Called")
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
        //load addtional symbols & formulas from firebase
        populateModelFromFireBase()
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
                url : symbolImport.csvData[i]["Url"]!)
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
    
    func populateModelFromFireBase() {
        print("config firebase")
        ref = Database.database().reference()
        ////////////////// Load for Symbols ///////////////////
        //Sync the data when an new item is inserted into the firebase
        print("Data from firebase:")
        dbHandle = ref?.child("symbols").observe(.childAdded, with: { (snapshot) in
            //Take the value from snapshot
            let symbol = snapshot.key
            let data = snapshot.value as? [String:Any]
            let name = String(describing: data?["name"] ?? "" )
            let meaning = String(describing: data?["meaning"] ?? "" )
            let translation = String(describing: data?["translation"] ?? "" )
            let tags = String(describing: data?["tags"] ?? "" )
            let url : String?
            if let u = data?["url"] {
                url = String(describing: u)
            } else {
                url = nil
            }
            
            let newSymbol = Symbol(
                symbol : symbol,
                name : name,
                meaning : meaning,
                translation: translation,
                img : nil,
                tags : tags,
                url : url)
            self.symbolArray.append(newSymbol)
            //print("symbol: \(symbol) data :\n \(data)")
            
        }) { (error) in
            print(error.localizedDescription)
        }
        //Sync update data when the firebase is data is changed
        ref?.child("symbols").observe(.childChanged, with: { (snapshot) in
            //Take the value from snapshot
            let symbol = snapshot.key
            let data = snapshot.value as? [String:Any]
            let name = String(describing: data?["name"] ?? "" )
            let meaning = String(describing: data?["meaning"] ?? "" )
            let translation = String(describing: data?["translation"] ?? "" )
            let tags = String(describing: data?["tags"] ?? "" )
            let url : String?
            if let u = data?["url"] {
                url = String(describing: u)
            } else {
                url = nil
            }
            
            for toSearchSymbol in self.symbolArray {
                if toSearchSymbol.symbol == symbol {
                    toSearchSymbol.name = name
                    toSearchSymbol.meaning = meaning
                    toSearchSymbol.translation = translation
                    toSearchSymbol.tags = tags
                    toSearchSymbol.url = url
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        //Sync the data when an item is deleted in the firebase
        ref?.child("symbols").observe(.childRemoved, with: { (snapshot) in
            //Take the value from snapshot
            let symbol = snapshot.key
            
            for (i,toSearchSymbol) in self.symbolArray.enumerated() {
                if toSearchSymbol.symbol == symbol {
                    self.symbolArray.remove(at: i)
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        ////////////////// Load for Formulas ///////////////////
        print("formulas from firebase:")
        dbHandle = ref?.child("formulas").observe(.childAdded, with: { (snapshot) in
            //Take the value from snapshot
            let staticformulas = snapshot.key
            let data = snapshot.value as? [String:Any]
            let name = String(describing: data?["name"] ?? "" )
            let info = String(describing: data?["info"] ?? "" )
            let tags = String(describing: data?["tags"] ?? "" )
            
            let newFormula = Formula(
                staticFormula: staticformulas,
                name: name,
                info: info,
                tags: tags)
            self.formulaArray.append(newFormula)
            //print("symbol: \(symbol) data :\n \(data)")
            
        }) { (error) in
            print(error.localizedDescription)
        }
        //Sync update data when the firebase is data is changed
        ref?.child("formulas").observe(.childChanged, with: { (snapshot) in
            //Take the value from snapshot
            let staticformulas = snapshot.key
            let data = snapshot.value as? [String:Any]
            let name = String(describing: data?["name"] ?? "" )
            let info = String(describing: data?["info"] ?? "" )
            let tags = String(describing: data?["tags"] ?? "" )
        
            for toSearchFormulas in self.formulaArray {
                if toSearchFormulas.staticFormula == staticformulas {
                    toSearchFormulas.name = name
                    toSearchFormulas.info = info
                    toSearchFormulas.tags = tags
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        //Sync the data when an item is deleted in the firebase
        ref?.child("formulas").observe(.childRemoved, with: { (snapshot) in
            //Take the value from snapshot
            let staticformulas = snapshot.key
            for (i,toSearchFormulas) in self.formulaArray.enumerated() {
                if toSearchFormulas.staticFormula == staticformulas {
                    self.formulaArray.remove(at: i)
                }
            }
        }) { (error) in
            print(error.localizedDescription)
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
