//
//  BannersViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BannersViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "FSPagerView", targetVC: FSPagerViewDemoController()),
                          ItemModel(title: "GKCycleScrollView", targetVC: GKCycleScrollViewController()),
                          ItemModel(title: "TYCycle", targetVC: TYCycleController())]
        
    }

}
