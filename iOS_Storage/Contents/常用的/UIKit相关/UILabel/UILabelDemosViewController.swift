//
//  UILabelDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UILabelDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "不规则label", targetVC: CQIrregularViewController())]
        
    }

}
