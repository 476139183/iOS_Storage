//
//  SwiftXibDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class SwiftXibDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "可视化圆角", targetVC: XibCornerViewController()),
                          ItemModel(title: "动态修改约束", targetVC: DynamicConstraintViewController()),
                          ItemModel(title: "自定义view", targetVC: SwiftXibCustomViewController()),
                          ItemModel(title: "scrollView", targetVC: SwiftXibScrollViewController()),
                          ItemModel(title: "tableView", targetVC: SwiftXibTableViewController()),
                          ItemModel(title: "collectionView", targetVC: SwiftXibCollectionViewController())]
        
    }
    
}
