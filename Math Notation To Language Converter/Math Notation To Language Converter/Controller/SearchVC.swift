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

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate, MathKeyboardDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Data
    var dictionary : Dictionary?
    
    var filterData = [Symbol]()
    var isSearching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filterData.count
        }
        if let dic = dictionary {
            return dic.symbolArray.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var symbolDetailVC: SymbolDetailVC
        symbolDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "symbolDetail") as! SymbolDetailVC
        //let symbolDetailVC = SymbolDetailVC()
        if isSearching {
            symbolDetailVC.symbol = filterData[indexPath.row]
        } else {
            if let dic = dictionary {
                symbolDetailVC.symbol = dic.symbolArray[indexPath.row]
            }
            
        }
        navigationController?.pushViewController(symbolDetailVC,animated:true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        if let dic = dictionary {
            if isSearching {
                cell.labelLeft.text = filterData[indexPath.row].symbol
                cell.labelRight.text = filterData[indexPath.row].name.trunc(length: 20)
                cell.symbol = filterData[indexPath.row]
            } else {
                cell.labelLeft.text = dic.symbolArray[indexPath.row].symbol
                cell.labelRight.text = dic.symbolArray[indexPath.row].name.trunc(length: 20)
                cell.symbol = dic.symbolArray[indexPath.row]
                
            }
        }
        
        return cell
    }
    
    func searchBar (_ searchBar : UISearchBar,textDidChange searchText : String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            if let dic = dictionary {
                filterData = dic.symbolArray.filter({$0.symbol.lowercased().range(of:searchBar.text!.lowercased()) != nil || $0.name.lowercased().range(of:searchBar.text!.lowercased()) != nil})
            }
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.setAsMathKeyboard(delegate: self)
        
        //Init dictionary
        dictionary = Dictionary()
        
    }
    
    func mathSymbolPressed(symbol: String) {
        search(text: symbol)
    }
    
    func search(text : String?) {
        if text == nil || text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            filterData = (dictionary?.symbolArray.filter({$0.symbol.lowercased().range(of:searchBar.text!.lowercased()) != nil || $0.name.lowercased().range(of:searchBar.text!.lowercased()) != nil}))!
            tableView.reloadData()
        }
    }
    
}
