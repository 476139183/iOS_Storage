//
//  NSTimerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class NSTimerDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            NSLog("ss")
        }
    }
    

}
