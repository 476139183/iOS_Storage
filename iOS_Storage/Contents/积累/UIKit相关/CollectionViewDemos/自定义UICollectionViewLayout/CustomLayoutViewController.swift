//
//  CustomLayoutViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/15.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class CustomLayoutViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "最大cell间距", targetVC: MaxCellSpacingViewController()),
                          ItemModel(title: "只有一个宽度自适应的cell靠左", targetVC: LeftSideCellViewController()),
                          ItemModel(title: "靠左并且可以设置最大间距", targetVC: LeftSideMaxCellSpacingViewController()),
                          ItemModel(title: "简单瀑布流", targetVC: WaterfallViewController())]
        
    }
    
}

