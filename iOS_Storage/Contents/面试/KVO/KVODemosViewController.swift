//
//  KVODemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/6/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class KVODemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "KVO基本操作", targetVC: ObserPropertyViewController()),
                          ItemModel(title: "KVO实现原理", targetVC: KVOTheoryViewController()),
                          ItemModel(title: "KVOController原理", targetVC: KVOControllerTheoryViewController()),
                          ItemModel(title: "更便捷的KVO", targetVC: MYKVOViewController())]
        
    }

}
