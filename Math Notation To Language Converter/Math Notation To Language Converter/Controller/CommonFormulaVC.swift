//
//  CommonFormulaVC.swift
//  Math Notation To Language Converter
//
//  Created by yujiazheng on 24/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

// Show a list of formula belonging to the category user selected with short description
// User change text in search bar, the result would be different and match the keywords
// User click one of the result, promote to FormulaDetail View
class CommonFormulaVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var formulaTableView: UITableView!
    
    var dictionary : Dictionary?
    var formulaList: [Formula] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary = Dictionary()
        if let dic = dictionary {
             formulaList = dic.formulaArray
        }
       
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulaList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var formulaDetailVc: FormulaDetailVC
        formulaDetailVc = self.storyboard?.instantiateViewController(withIdentifier: "formulaDetail") as! FormulaDetailVC
        formulaDetailVc.formulaToShow = formulaList[indexPath.row]
        navigationController?.pushViewController(formulaDetailVc, animated:true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "commonFormulaCell")
        cell.textLabel?.text = formulaList[indexPath.row].getFormula()
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTextChanged(keyword: searchBar.text!)
    }
    
    // Function for text in search bar changed
    func searchTextChanged(keyword: String) {
        if let dic = dictionary {
            let commonFArray = dic.formulaArray
            if keyword == "" {
                formulaList = commonFArray
            } else {
                var fileteredList: [Formula] = []
                for formula in commonFArray {
                    if (formula.name.lowercased().contains(keyword.lowercased()) || formula.getFormula().lowercased().contains(keyword.lowercased())) {
                        fileteredList.append(formula)
                    } else {
                        if (formula.info.contains(keyword)) {
                            fileteredList.append(formula)
                        }
                    }
                }
                formulaList = fileteredList
            }
        }
        
        formulaTableView.reloadData()
    }
    
    // Function for user click one of the common formula?
}

