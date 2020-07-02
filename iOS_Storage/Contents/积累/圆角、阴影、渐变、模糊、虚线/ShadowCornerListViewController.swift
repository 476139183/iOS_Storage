//
//  ShadowCornerListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ShadowCornerListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "圆角和阴影", targetVC: ShadowCornerListViewController()),
                          ItemModel(title: "模糊", targetVC: BlurEffectViewController()),
                          ItemModel(title: "毛玻璃2", targetVC: BlurEffectViewController2()),
                          ItemModel(title: "渐变", targetVC: GradientDemoViewController()),
                          ItemModel(title: "虚线", targetVC: ImaginaryLineViewController())]
        
    }

}
