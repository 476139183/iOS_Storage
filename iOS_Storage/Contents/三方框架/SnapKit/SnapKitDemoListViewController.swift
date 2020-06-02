//
//  SnapKitDemoListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SnapKitDemoListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "常规操作", targetVC: SnapKitDemoViewController()),
                          ItemModel(title: "更多功能", targetVC: SnapKitMoreViewController())]
        
    }

}
