//
//  UIStackViewDemoListController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class UIStackViewDemoListController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "各种demo", targetVC: StackViewDemoViewController()),
                          ItemModel(title: "横向等间距3标题", targetVC: StackThreeTitlesViewController()),
                          ItemModel(title: "xib中使用UIStackView", targetVC: StackInXibViewController())]
        
    }

}
