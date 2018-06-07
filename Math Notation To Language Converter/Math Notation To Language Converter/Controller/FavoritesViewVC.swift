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
class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var favSearchBar: UISearchBar!
    @IBOutlet weak var favTable: UITableView!
    
    var favFors: [Formula] = []
    var favSymbols: [Symbol] = []
    
    var favList: [Any] = []
    var originalList: [Any] = []
    
    var dictionary: Dictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary = Dictionary()
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
                if let dic = dictionary {
                    print(dic.getSymbolDataBySymbol(symbolCharacter: item.symbol)!)
                    favList.append(dic.getSymbolDataBySymbol(symbolCharacter: item.symbol)!)
                }
            }
        }
        originalList = favList
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
    
    //for searching favourites list
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            var filteredList: [Any] = []
            for item in favList {                   //Check both symbols and formulas
                if let symbolItem = item as? Symbol {
                    if symbolItem.symbol.lowercased().contains(searchText) || symbolItem.name.lowercased().contains(searchText) {
                        filteredList.append(symbolItem)
                    }
                }
                if let formulaItem = item as? Formula {
                    if formulaItem.getFormula().lowercased().contains(searchText) || formulaItem.name.contains(searchText) {
                        filteredList.append(formulaItem)
                    }
                }
            }
            favList = filteredList
        } else {
            favList = originalList
        }
        
        favTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favSearchBar.text = ""
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
                if let dic = dictionary {
                    print(dic.getSymbolDataBySymbol(symbolCharacter: item.symbol)!)
                    favList.append(dic.getSymbolDataBySymbol(symbolCharacter: item.symbol)!)
                }
            }
        }
        favTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

