//
//  GenericsCatTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/4.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsCatTableViewController: GenericsTableViewController<GenericsCatModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = "泛型 cat"
        
        let cat1 = GenericsCatModel.init(color: .red)
        let cat2 = GenericsCatModel.init(color: .blue)
        
        self.data = [cat1, cat2]
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "reuseID"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseID)
        }
        cell?.backgroundColor = data[indexPath.row].color

        return cell!
    }

}

class GenericsCatModel {
    
    var color = UIColor.white
    
    init(color: UIColor) {
        self.color = color
    }
    
}
