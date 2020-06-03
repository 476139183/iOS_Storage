//
//  DataDriveTableViewViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/30.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class DataDriveTableViewViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "Swift 简单版", targetVC: SimpleDataDriveViewController()),
                          ItemModel(title: "OC 简单版", targetVC: OCSimpleDataDriveViewController())]
        
    }

}
