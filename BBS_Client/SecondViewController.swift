//
//  SecondViewController.swift
//  BBS_Client
//
//  Created by Alexandre Louf on 30/01/2019.
//  Copyright © 2019 Zerbi Clément. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var enregistrement = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enregistrement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let c = tableView.dequeueReusableCell(withIdentifier: "Cellule") {
            cell = c
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier :"Cellule")
        }
        
        //cell.textLabel?.text = "Résultat : " + enregistrement[indexPath.row].resultat + " enregistré le : " + enregistrement[indexPath.row].date
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
