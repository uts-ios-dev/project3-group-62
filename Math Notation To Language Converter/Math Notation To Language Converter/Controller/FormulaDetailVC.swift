//
//  FormulaDetailVC.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 24/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

// Show the detail of selected common formula, or the formula user inputed
// if the formula textfield changed, defination and meaning will also be changed
class FormulaDetailVC: UIViewController {
    
    var formulaToShow: Formula?
    
    @IBOutlet weak var sourceLinkBtn: UIButton!
    @IBOutlet weak var formulaInputEt: UITextField!
    @IBOutlet weak var translationTv: UITextView!
    @IBOutlet weak var meaningT: UITextView!
    @IBOutlet weak var likeBtn: UIButton!
    
    let dictionary = Dictionary()
    var formulaInput: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        sourceLinkBtn.setTitle("https://en.wikipedia.org/wiki/Bessel_function", for: .normal)
        // Do any additional setup after loading the view.
        if (formulaToShow != nil) {
            print("static fomrula: " + (formulaToShow?.getFormula())!)
            formulaInputEt.text = formulaToShow?.getFormula()
            translationTv.text = formulaToShow?.name
            meaningT.text = formulaToShow?.info
        } else {
            print("dynamic formula")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function for text changed in formula textfield?
    @IBAction func textDidchange(_ sender: UITextField) {
        formulaInput = sender.text!
        print("formula input changed")
        if formulaToShow != nil && sender.text == formulaToShow?.getFormula() {
            formulaInputEt.text = formulaToShow?.getFormula()
            translationTv.text = formulaToShow?.name
            meaningT.text = formulaToShow?.info
        } else {
            if sender.text == "" {
                translationTv.text = "Input your formula"
                likeBtn.isEnabled = false
            }
            let formulaArray: [String] = getFormulaArray(formula: formulaInput)
            
            updateMeaningTv(formulaArray: formulaArray)
            updateTranslate(formulaArray: formulaArray)
        }
    }
    
    // Sepreate symbols and values in formula into string array
    func getFormulaArray (formula: String) -> [String] {
        var formulaArray: [String] = []
        for charVal in formula {
            if (charVal != " ") {
                formulaArray.append(String(charVal))
            }
        }
        return formulaArray
    }
    
    // Update meanning text view
    func updateMeaningTv(formulaArray: [String]) {
        var meaning: String = ""
        for singleItem in formulaArray {
            let symbolInFormula = dictionary.getSymbolDataBySymbol(symbolCharacter: singleItem)
            if symbolInFormula != nil {
                print(symbolInFormula?.meaning ?? "No meaning found")
                meaning.append((symbolInFormula?.symbol)! + ": " + (symbolInFormula?.meaning)! + "\n")
            } else {
                meaning.append(singleItem)
                if Int(singleItem) != nil {
                    meaning.append(": value ")
                } else {
                    meaning.append(": charactor ");
                }
                meaning.append(singleItem + "\n");
            }
        }
        meaningT.text = meaning
    }
    
    func updateTranslate(formulaArray: [String]) {
        var translation: String = ""
        for singleItem in formulaArray {
            let symbolInformula = dictionary.getSymbolDataBySymbol(symbolCharacter: singleItem)
            if symbolInformula != nil {
                translation.append((symbolInformula?.translation)! + " ")
            } else {
                translation.append(singleItem + " ")
            }
        }
        print(translation)
        translationTv.text = translation
    }

    // Function for source link clicked, call openUrl function to open it
    @IBAction func sourceLinkClicked(_ sender: UIButton) {
        openUrl(url: (sourceLinkBtn.titleLabel?.text)!)
    }
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        var formulas: [Formula] = []
        var encodeData: Data;
        
        var formulaToLike = Formula(staticFormula: formulaInputEt.text!, name: translationTv.text, info: meaningT.text, tags: "tag")
        
        if (UserDefaults.standard.object(forKey: "favFors") != nil) {
            encodeData = UserDefaults.standard.object(forKey: "favFors") as! Data
            formulas = NSKeyedUnarchiver.unarchiveObject(with: encodeData) as! [Formula]
        }
        formulas.append(formulaToLike)
        
        // encode
        encodeData = NSKeyedArchiver.archivedData(withRootObject: formulas)
        UserDefaults.standard.set(encodeData, forKey: "favFors")
        UserDefaults.standard.synchronize()
    }
}
