//
//  FloatingLayerDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/10.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class FloatingLayerDemoViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel.init(title: "浮层Controller", targetVC: SupernatantViewController()),
                          ItemModel.init(title: "弹出半透明Controller", targetVC: PushTranslucenceViewController()),
                          ItemModel.init(title: "菊花loading", targetVC: SystemLoadingViewController())]
        
    }

}
