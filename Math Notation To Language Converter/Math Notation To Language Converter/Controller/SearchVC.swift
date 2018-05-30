//
//  SearchViewController.swift
//  Math Notation To Language Converter
//
//  Created by サイラク on 2018/5/29.
//  Copyright © 2018年 Summer Studios. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var data : [String] = []
    var filterData = [String]()
    var isSeaching = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSeaching {
            return filterData.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if isSeaching {
            cell.textLabel?.text = filterData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
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
            filterData = data.filter({$0 == searchBar.text})
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        //Load data
        let dictionary = Dictionary()
        dictionary.testAddData()
        data = dictionary.getAllSymbolsList()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
