//
//  NestedTableDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class NestedTableDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "嵌套tableView", targetVC: NestedTableViewController()),
                          ItemModel(title: "多重嵌套tableView", targetVC: SuperNestedTableViewController()),
                          ItemModel(title: "同时滑动的scrollView", targetVC: GestureScrollViewController())]
        
    }
    
}

