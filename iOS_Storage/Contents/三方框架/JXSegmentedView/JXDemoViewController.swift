//
//  JXDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/11/4.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class JXDemoViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "纯文本title", targetVC: JXSegmentedViewDemoViewController()),
                          ItemModel(title: "文字和图片", targetVC: JXImageTitleViewController()),
                          ItemModel(title: "文字或图片", targetVC: JXImageOrTextViewController()),
                          ItemModel(title: "混合cell", targetVC: JXMixViewController()),
                          ItemModel(title: "自定义cell", targetVC: JXCustomViewController()),
                          ItemModel(title: "红点segment", targetVC: RedDotSegmentViewController()),
                          ItemModel(title: "单独的segment", targetVC: SingleSegmentedViewController()),]
    }
    
}
