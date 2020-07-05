//
//  SwiftUIDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/5.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "基础控件", targetVC: BaseHostingController(rootView: SwiftUIBasicView()))]
        
    }
    
}
