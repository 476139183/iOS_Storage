//
//  ElegantViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/4/28.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ElegantViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "优雅的 Objective-C", targetVC: CQElegantOCViewController()),
                          ItemModel.init(title: "优雅的 Swift", targetVC: ElegantSwiftViewController())]
    }

}
