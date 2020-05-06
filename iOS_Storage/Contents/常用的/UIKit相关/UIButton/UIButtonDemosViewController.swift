//
//  UIButtonDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UIButtonDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "自定义button", targetVC: CQCustomButtonController()),
                          ItemModel.init(title: "排序button", targetVC: CQSortButtonDemoController()),
                          ItemModel.init(title: "扩大按钮响应区域", targetVC: EnlargeActionViewController()),
                          ItemModel.init(title: "修改按钮响应区域", targetVC: ResponseAreaTestViewController())]
        
        
        
    }

}
