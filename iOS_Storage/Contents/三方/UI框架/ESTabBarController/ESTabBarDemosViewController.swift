//
//  ESTabBarDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/18.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ESTabBarDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "选中状态tab变大", targetVC: SelectedTabBiggerViewController())]
        
    }

}
