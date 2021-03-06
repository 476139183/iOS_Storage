//
//  TTTLabelDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TTTLabelDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "基本操作", targetVC: TTTBasicViewController()),
                          ItemModel(title: "正则", targetVC: TTTLabelViewController()),
                          ItemModel(title: "修改点击链接颜色", targetVC: TTTChangeLinkColorViewController()),
                          ItemModel(title: "xib中使用", targetVC: XibTTTLabelViewController())]
        
    }
    
}
