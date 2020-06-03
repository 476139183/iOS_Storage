//
//  RuntimeDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class RuntimeDemoViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "消息发送", targetVC: CQMessageSendController()),
                          ItemModel(title: "消息转发", targetVC: CQUnrecognizedSelectorController())]
        
    }

}
