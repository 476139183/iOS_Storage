//
//  SameModelTableViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/12/29.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class SameModelTableViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataArray = [ItemModel(title: "基于抽象基类", targetVC: AbstractClassTableViewController()),
                          ItemModel(title: "基于协议", targetVC: ProtocolTableViewController()),
                          ItemModel(title: "基于baseCell", targetVC: BaseCellTableViewController<Any, BaseCell<Any>>())]
    }
    
}
