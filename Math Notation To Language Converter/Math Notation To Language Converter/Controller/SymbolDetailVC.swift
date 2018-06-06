//
//  SymbolDetailVC.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/6/2.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import UIKit

class SymbolDetailVC: UIViewController {
    
    var symbol : Symbol?
    //Ui Elements
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var meaningLabel: UITextView!
    
    @IBOutlet weak var translationLabel: UITextView!
    
    @IBOutlet weak var openUrlBtn: UIButton!
    @IBAction func onUrlBtnPressed(_ sender: UIButton) {
        if let url = symbol?.url {
            openUrl(url: url)
        }
    }
    
    @IBOutlet weak var likeBtn: UIButton!
    
    var favSymbols: [Symbol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         let dic = Dictionary()
         self.symbol = dic.symbolArray[31]
         */
        //Fetch & display the data to the view
        if let symbol = self.symbol {
            symbolLabel.text = symbol.symbol
            nameLabel.text = symbol.name
            meaningLabel.text = symbol.meaning
            translationLabel.text = symbol.translation
        }
        
        if symbol?.url == nil {
            openUrlBtn.isEnabled = false
            openUrlBtn.backgroundColor = UIColor.gray
            
        }
        
        if (UserDefaults.standard.object(forKey: "favSymbols") != nil) {
            let decode = UserDefaults.standard.object(forKey: "favSymbols") as! Data
            favSymbols = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [Symbol]
            
            for item in favSymbols {
                if item.symbol == symbol?.symbol {
                    likeBtn.isEnabled = false
                    likeBtn.setTitleColor(UIColor(red: 187/255, green: 222/255, blue: 251/255, alpha: 1), for: UIControlState.disabled)
                    break
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeSymbol(_ sender: UIButton) {
        var symbols: [Symbol] = []
        var encodeData: Data;
        
        if (UserDefaults.standard.object(forKey: "favSymbols") != nil) {
            encodeData = UserDefaults.standard.object(forKey: "favSymbols") as! Data
            symbols = NSKeyedUnarchiver.unarchiveObject(with: encodeData) as! [Symbol]
        }
        symbols.append(symbol!)
        
        // encode
        encodeData = NSKeyedArchiver.archivedData(withRootObject: symbols)
        UserDefaults.standard.set(encodeData, forKey: "favSymbols")
        UserDefaults.standard.synchronize()
        likeBtn.isEnabled = false
        likeBtn.setTitleColor(UIColor(red: 187/255, green: 222/255, blue: 251/255, alpha: 1), for: UIControlState.disabled)
    }
    
}

