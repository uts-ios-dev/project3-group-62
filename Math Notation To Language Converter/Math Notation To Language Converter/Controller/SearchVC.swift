//
//  SearchViewController.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/29.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    var symbol : Symbol?
    
}

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate, NumericKeyboardDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Data
    let dictionary = Dictionary()
   
    var filterData = [Symbol]()
    var isSeaching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSeaching {
            return filterData.count
        }
        return dictionary.symbolArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var symbolDetailVC: SymbolDetailVC
        symbolDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "symbolDetail") as! SymbolDetailVC
        //let symbolDetailVC = SymbolDetailVC()
        if isSeaching {
            symbolDetailVC.symbol = filterData[indexPath.row]
        } else {
            symbolDetailVC.symbol = dictionary.symbolArray[indexPath.row]
        }
        navigationController?.pushViewController(symbolDetailVC,animated:true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        if isSeaching {
            cell.labelLeft.text = filterData[indexPath.row].symbol
            cell.labelRight.text = filterData[indexPath.row].name.trunc(length: 15)
            cell.symbol = filterData[indexPath.row]
        } else {
            cell.labelLeft.text = dictionary.symbolArray[indexPath.row].symbol
            cell.labelRight.text = dictionary.symbolArray[indexPath.row].name.trunc(length: 15)
            cell.symbol = dictionary.symbolArray[indexPath.row]
            
        }
        return cell
    }
    
    func searchBar (_ searchBar : UISearchBar,textDidChange searchText : String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSeaching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSeaching = true
            filterData = dictionary.symbolArray.filter({$0.symbol.lowercased().range(of:searchBar.text!.lowercased()) != nil || $0.name.lowercased().range(of:searchBar.text!.lowercased()) != nil})
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.setAsNumericKeyboard(delegate: self)
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numericKeyPressed(key: Int) {
        //protocol stub
    }
    
    func numericBackspacePressed() {
        //protocol stub
    }
    
    func numericSymbolPressed(symbol: String) {
        //protocol stub
    }
  
}
