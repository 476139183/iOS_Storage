//
//  YYDemoListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/30.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class YYDemoListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "YYText", targetVC: YYTextDemoViewController()),
                          ItemModel(title: "YYTextView", targetVC: YYTextViewDemoController())]
        
    }

}
