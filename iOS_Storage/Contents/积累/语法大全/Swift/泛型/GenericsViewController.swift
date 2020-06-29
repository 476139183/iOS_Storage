//
//  GenericsViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GenericsViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.detailUrl = "https://www.runoob.com/swift/swift-generics.html"
        
        self.dataArray = [ItemModel(title: "泛型基础", targetVC: GenericsBasicViewController())]
        
    }

}
