//
//  TextureDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/9/23.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit

class TextureDemoViewController: JumpListViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "ASViewController", targetVC: ASViewControllerDemoController()),
                          ItemModel(title: "ASTableView", targetVC: ASTableDemoController()),
                          ItemModel(title: "各种node", targetVC: TextureNodeDemoViewController()),
                          ItemModel(title: "Layout", targetVC: TextureLayoutDemoViewController()),
                          ItemModel(title: "table demo2", targetVC: TextureTableDemo2Controller())]
        
    }
    
    
}
