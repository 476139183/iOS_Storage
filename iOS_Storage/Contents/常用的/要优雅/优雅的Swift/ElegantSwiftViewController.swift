//
//  ElegantSwiftViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/1/3.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class ElegantSwiftViewController: JumpListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "优雅的通知", targetVC: ElegantNotifViewController())]
        
//        Notification.Name.ss
//
//        NSAttributedString.Key
        
        
        
        
        
    }

}


