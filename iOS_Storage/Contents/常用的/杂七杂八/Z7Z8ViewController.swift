//
//  Z7Z8ViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2020/5/21.
//  Copyright © 2020 蔡强. All rights reserved.
//

import UIKit

class Z7Z8ViewController: JumpListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.dataArray = [ItemModel(title: "图片压缩", targetVC: CompressImageViewController()),
                          ItemModel(title: "image和text互转", targetVC: ImageTextConvertViewController())]
        
    }
    
}
