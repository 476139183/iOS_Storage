//
//  LocalStorageFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class LocalStorageFrameworkViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "MMKV", targetVC: MMKVDemoViewController())]
        
    }
    
}
