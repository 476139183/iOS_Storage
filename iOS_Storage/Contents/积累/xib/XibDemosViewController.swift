//
//  XibDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/2.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class XibDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "OC", targetVC: OCXibDemosViewController()),
                          ItemModel(title: "Swift", targetVC: SwiftXibDemosViewController())]
        
    }
    
}
