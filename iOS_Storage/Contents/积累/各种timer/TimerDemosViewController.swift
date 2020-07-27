//
//  TimerDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class TimerDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "NSTimer", targetVC: NSTimerDemoViewController()),
                          ItemModel(title: "CADisplayLink", targetVC: CADisplayLinkDemoViewController()),
                          ItemModel(title: "GCDTimer", targetVC: GCDTimerDemoViewController())]
        
    }
    
}
