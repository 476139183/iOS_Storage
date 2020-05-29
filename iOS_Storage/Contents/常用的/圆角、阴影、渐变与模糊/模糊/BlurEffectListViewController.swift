//
//  BlurEffectListViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/29.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class BlurEffectListViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "UIVisualEffectView xib", targetVC: BlurEffectViewController()),
                          ItemModel(title: "UIVisualEffectView xib", targetVC: BlurEffectViewController2())]
        
    }

}
