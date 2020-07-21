//
//  GradientDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GradientDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "OC", targetVC: CQGradientOCDemoViewController()),
                          ItemModel(title: "Swift", targetVC: GradientSwiftDemoViewController()),
                          ItemModel(title: "Xib", targetVC: GradientXibController())]
        
    }
    
}
