//
//  MarqueeDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/9/1.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import MarqueeLabel

class MarqueeDemoViewController: CQBaseViewController {
    
    var lengthyLabel = MarqueeLabel.init(frame: .init(x: 20, y: 100, width: 300, height: 20), duration: 8.0, fadeLength: 10.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(lengthyLabel)
        lengthyLabel.text = "跑马灯ddf打飞机考虑到飞机票房间大框架覅偶大鸡排的放假哦我发泡底付家坡我ad放假偶家if大家啊if很大方福建安康路附近爱的；类似打开房间啊"
        lengthyLabel.backgroundColor = .orange
        
    }

}
