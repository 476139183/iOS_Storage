//
//  FSPagerViewDemoController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FSPagerViewDemoController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "Banner", targetVC: FSPagerBannerViewController()),
                          ItemModel(title: "Transformer", targetVC: FSPagerTransformerController()),
                          ItemModel(title: "PageControl", targetVC: FSPageControlViewController())]
        
    }
    
}
