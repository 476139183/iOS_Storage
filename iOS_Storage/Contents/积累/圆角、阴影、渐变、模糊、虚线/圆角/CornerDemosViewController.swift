//
//  CornerDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CornerDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "基本操作", targetVC: CornerAndShadowViewController()),
                          ItemModel(title: "封装", targetVC: CornerTestViewController())]
        
    }

}
