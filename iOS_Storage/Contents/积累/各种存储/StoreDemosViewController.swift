//
//  StoreDemosViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/17.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class StoreDemosViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "UserDefaults", targetVC: UserDefaultsViewController()),
                          ItemModel(title: "归档", targetVC: ArchiveDemosViewController()),
                          ItemModel(title: "Codable", targetVC: CodableDemosViewController())]
        
    }
    
}
