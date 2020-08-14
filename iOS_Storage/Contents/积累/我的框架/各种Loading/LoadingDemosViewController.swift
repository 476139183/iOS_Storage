//
//  LoadingDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/14.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class LoadingDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "气泡loading", targetVC: BubbleLoadingViewController()),
                          ItemModel(title: "椰子loading", targetVC: YeezyLoadingViewController())]
        
    }
    
}
