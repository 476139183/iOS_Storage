//
//  GenericsTableDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsTableDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "泛型tableView person", targetVC: GenericsPersonTableViewController()),
                          ItemModel(title: "泛型 cat tableView", targetVC: GenericsCatTableViewController()),
                          ItemModel(title: "泛型 tableView 2", targetVC: GenericsTableViewController2()),
                          ItemModel(title: "泛型 tableView 3，一种cell", targetVC: GenericsTableViewController3()),
                          ItemModel(title: "泛型 tableView 3.1，多种cell", targetVC: GenericsTableViewController31())]
        
    }
    
}
