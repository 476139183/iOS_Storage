//
//  UltimateTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/15.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UltimateTableViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "flat", targetVC: FlatTableDemoViewController()),
                          ItemModel(title: "grouped", targetVC: GroupedTableDemoViewController())]
        
    }

}
