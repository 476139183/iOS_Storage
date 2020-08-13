//
//  EasyButtonDemosController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/8/13.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class EasyButtonDemosController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "纯代码", targetVC: EasyButtonViewController()),
                          ItemModel(title: "xib", targetVC: XibEasyButtonViewController())]
        
    }
    
}
