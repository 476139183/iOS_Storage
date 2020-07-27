//
//  CADisplayLinkDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/27.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class CADisplayLinkDemoViewController: CQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let a: Double = 112345
        let minute: Int = Int(a / 1000 / 60)
        let second: Double = Double(a/1000.0) - Double(minute * 60)
        print(second)
    }

}
