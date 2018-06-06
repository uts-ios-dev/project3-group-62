//
//  FavoriteViewController.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 17/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

/**
 * In this view a list of favorite symbols and formulas will be shown
 */
class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favSearchBar: UISearchBar!
    @IBOutlet weak var favTable: UITableView!
    
    var favFors: [Formula] = []
    var favSymbols: [Symbol] = []
    
    var favList: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if (UserDefaults.standard.object(forKey: "favFors") != nil) {
            let decode = UserDefaults.standard.object(forKey: "favFors") as! Data
            favFors = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [Formula]
            
            // test content
            for item in favFors {
                favList.append(item)
            }
        }
        
        if (UserDefaults.standard.object(forKey: "favSymbols") != nil) {
            let decode = UserDefaults.standard.object(forKey: "favSymbols") as! Data
            favSymbols = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [Symbol]
            
            // test content
            for item in favSymbols {
                favList.append(item)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = favList[indexPath.row] as? Symbol {
            var symbolDetailVC: SymbolDetailVC
            symbolDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "symbolDetail") as! SymbolDetailVC
            symbolDetailVC.symbol = item
            navigationController?.pushViewController(symbolDetailVC, animated: true)
        }
        if let item = favList[indexPath.row] as? Formula {
            var formulaDetailVc: FormulaDetailVC
            formulaDetailVc = self.storyboard?.instantiateViewController(withIdentifier: "formulaDetail") as! FormulaDetailVC
            formulaDetailVc.formulaToShow = item
            navigationController?.pushViewController(formulaDetailVc, animated:true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "favoritesCell")
        if let item = favList[indexPath.row] as? Symbol {
            cell.textLabel?.text = item.symbol
        }
        if let item = favList[indexPath.row] as? Formula {
            cell.textLabel?.text = item.getFormula()
        }
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favList = []
        if (UserDefaults.standard.object(forKey: "favFors") != nil) {
            let decode = UserDefaults.standard.object(forKey: "favFors") as! Data
            favFors = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [Formula]
            for item in favFors {
                favList.append(item)
            }
        }
        
        if (UserDefaults.standard.object(forKey: "favSymbols") != nil) {
            let decode = UserDefaults.standard.object(forKey: "favSymbols") as! Data
            favSymbols = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [Symbol]
            
            // test content
            for item in favSymbols {
                favList.append(item)
            }
        }
        favTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

