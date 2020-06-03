//
//  UIFrameworkViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UIFrameworkViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "iconfont", targetVC: IconFontViewController()),
                          ItemModel(title: "JXSegmentedView", targetVC: JXDemoViewController()),
                          ItemModel(title: "嵌套tableView", targetVC: NestedTableDemoViewController()),
                          ItemModel(title: "SideMenu", targetVC: SideMenuViewController()),
                          ItemModel(title: "TTTAttributedLabel", targetVC: TTTLabelViewController())]
        
    }
    
}
