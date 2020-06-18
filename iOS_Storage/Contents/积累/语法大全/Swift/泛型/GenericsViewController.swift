//
//  GenericsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.detailUrl = "https://www.runoob.com/swift/swift-generics.html"
        
        self.dataArray = [ItemModel(title: "泛型基础", targetVC: GenericsBasicViewController()),
                          ItemModel(title: "泛型tableView person", targetVC: GenericsPersonTableViewController()),
                          ItemModel(title: "泛型 cat tableView", targetVC: GenericsCatTableViewController()),
                          ItemModel(title: "泛型 tableView 2", targetVC: GenericsTableViewController2()),
                          ItemModel(title: "泛型 tableView 3", targetVC: GenericsTableViewController3())]
        
    }

}
