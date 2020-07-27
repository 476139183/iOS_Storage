//
//  PickerDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/7/25.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class PickerDemosViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "日期与时间", targetVC: DateTimePickerViewController())]
        
    }
    
    

}
