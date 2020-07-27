//
//  GCDTimerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class GCDTimerDemoViewController: CQBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    deinit {
        MCGCDTimer.shared.cancleTimer(WithTimerName: "GCDTimer")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let timer = GCDTimer(intervalInSecs: 1)
//
//        timer.Event = {
//
//            print("00")
//            // Send some data to the server
//        }
//
//        timer.start()
        
        MCGCDTimer.shared.scheduledDispatchTimer(WithTimerName: "GCDTimer", timeInterval: 0.001, queue: .main, repeats: true) {
            //code need to be execute
            NSLog("111")
        }
    }
    
}
