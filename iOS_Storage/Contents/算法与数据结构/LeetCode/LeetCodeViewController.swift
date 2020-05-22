//
//  LeetCodeViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/3.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class LeetCodeViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "两数之和", targetVC: LeetCodeTwoSumViewController())]
        
    }

}
