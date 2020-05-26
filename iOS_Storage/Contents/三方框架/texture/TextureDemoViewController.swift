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
                          ItemModel(title: "投票 cell", targetVC: TextureTableDemo2Controller()),
                          ItemModel(title: "table demo 3", targetVC: TextureTableDemo3Controller()),
                          ItemModel(title: "OC版 table", targetVC: OCTextureTableController()),
                          ItemModel(title: "纯texture tableView", targetVC: PureTextureTableController()),
                          ItemModel(title: "自定义Node", targetVC: CustomNodeViewController()),
                          ItemModel(title: "话题Node", targetVC: TalkNodeViewController())]
        
    }
    
    
}
