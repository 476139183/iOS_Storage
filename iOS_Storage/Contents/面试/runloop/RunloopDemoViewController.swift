//
//  RunloopDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/22.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class RunloopDemoViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "常驻线程", targetVC: CQPermanentThreadController()),
                          ItemModel(title: "mode切换", targetVC: CQRunloopModeController()),
                          ItemModel(title: "runloop生命周期", targetVC: CQRunLoopLifeController())]
        
    }
    
}
